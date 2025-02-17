# api_gateway/app.py
from flask import Flask, request, jsonify, Response
import requests
import os
from functools import wraps
import jwt
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'your_default_secret_key')  # Lấy từ biến môi trường, fallback nếu không có

# URLs của các microservices (lấy từ biến môi trường)
USERS_SERVICE_URL = os.environ.get('USERS_SERVICE_URL', 'http://localhost:8001')
POSTS_SERVICE_URL = os.environ.get('POSTS_SERVICE_URL', 'http://localhost:8002')
COMMENTS_SERVICE_URL = os.environ.get('COMMENTS_SERVICE_URL', 'http://localhost:8003')

# --- Authentication ---

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')

        if not token:
            return jsonify({'message': 'Token is missing!'}), 401

        try:
            # Loại bỏ "Bearer " prefix nếu có
            token = token.replace("Bearer ", "")
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=["HS256"])
            current_user = data['user_id'] # Hoặc username, tùy vào payload của bạn
        except jwt.ExpiredSignatureError:
            return jsonify({'message': 'Token has expired!'}), 401
        except jwt.InvalidTokenError:
            return jsonify({'message': 'Token is invalid!'}), 401
        except Exception as e:
            return jsonify({'message': str(e)}), 500

        return f(current_user, *args, **kwargs)  # Truyền user_id vào view function
    return decorated


# --- Reverse Proxy ---

def proxy_request(service_url, path):
    """
    Generic function to proxy requests to a microservice.
    """
    url = f"{service_url}/{path}"
    headers = request.headers
    # Chuyển tiếp X-User header nếu có
    if 'X-User' in request.headers:
        headers = request.headers
    else:
        headers = request.headers.copy() # Tạo bản sao để không sửa đổi request gốc
        user_id = get_user_id_from_token(request) # Lấy user_id từ token
        if user_id:
            headers['X-User'] = str(user_id)  # Chuyển user_id sang string

    try:
        resp = requests.request(
            method=request.method,
            url=url,
            headers=headers,
            data=request.get_data(),
            params=request.args,
            stream=True, # Quan trọng để xử lý các response lớn (ví dụ: streaming video)
            timeout=10 # Thêm timeout để tránh treo
        )

        # Trả về response từ microservice
        excluded_headers = ['content-encoding', 'content-length', 'transfer-encoding', 'connection'] # Loại bỏ các header không cần thiết
        headers = [(name, value) for (name, value) in resp.raw.headers.items()
                   if name.lower() not in excluded_headers]

        return Response(resp.content, resp.status_code, headers)

    except requests.exceptions.RequestException as e:
        print(f"Error proxying request: {e}")
        return jsonify({"error": "Service unavailable"}), 503

def get_user_id_from_token(request):
  """Lấy user_id từ token (nếu có)"""
  token = request.headers.get('Authorization')
  if not token:
    return None
  try:
    token = token.replace("Bearer ", "")
    data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=["HS256"])
    return data['user_id'] # Hoặc 'username' nếu bạn dùng username trong JWT payload
  except:
    return None

# --- Routes ---

@app.route("/users/<path:path>", methods=['GET', 'POST', 'PUT', 'DELETE'])
@token_required # Yêu cầu xác thực cho tất cả các request đến users service
def proxy_users(current_user, path):
    """Proxy requests to the users service."""
    print(f"User {current_user} accessing users service")
    return proxy_request(USERS_SERVICE_URL, path)

@app.route("/posts/<path:path>", methods=['GET', 'POST', 'PUT', 'DELETE'])
@token_required # Yêu cầu xác thực
def proxy_posts(current_user, path):
    """Proxy requests to the posts service."""
    return proxy_request(POSTS_SERVICE_URL, path)

@app.route("/comments/<path:path>", methods=['GET', 'POST', 'PUT', 'DELETE'])
@token_required # Yêu cầu xác thực
def proxy_comments(current_user, path):
    """Proxy requests to the comments service."""
    return proxy_request(COMMENTS_SERVICE_URL, path)

# --- Health Check ---

@app.route("/health")
def health_check():
    """Health check endpoint."""
    return jsonify({"status": "ok"}), 200


if __name__ == '__main__':
    app.run(debug=True, port=8000)