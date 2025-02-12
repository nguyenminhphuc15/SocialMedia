import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { throwError } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private apiUrl = 'http://localhost:8080/api/auth/user/login';

  constructor(private http: HttpClient, private router: Router) {}

  /**
   * Đăng nhập người dùng
   * @param email Tên đăng nhập
   * @param password Mật khẩu
   * @returns Observable với thông tin người dùng và token
   */
  login(email: string, password: string): Observable<any> {
    // Tạo đối tượng FormData để gửi email và password dưới dạng form-data
    const formData = new FormData();
    formData.append('email', email);
    formData.append('password', password);

    // Gửi yêu cầu POST với nội dung là FormData
    return this.http.post<any>(this.apiUrl, formData).pipe(
      map((response) => {
        // Lưu token và các thông tin người dùng vào sessionStorage
        this.setToken(response.data.token);
        this.setUserInfo(response.data); // Lưu thông tin người dùng
        this.setTokenExpiration(response.data.tokenExpirationTime); // Lưu thời gian hết hạn của token
        this.setRefreshToken(response.data.refreshToken);
        this.setRefreshTokenExpiration(
          response.data.refreshTokenExpirationTime
        ); // Lưu thời gian hết hạn của refresh token
        return response;
      }),
      catchError(this.handleError) // Xử lý lỗi
    );
  }

  /**
   * Đăng ký người dùng mới
   * @param email Địa chỉ email
   * @param password Mật khẩu
   * @returns Observable với phản hồi từ server
   */
  register(email: string, password: string): Observable<any> {
    const formData = new FormData();
    formData.append('email', email);
    formData.append('password', password);

    return this.http
      .post<any>(`${this.apiUrl}/register`, formData)
      .pipe(catchError(this.handleError));
  }

  /**
   * Đăng xuất người dùng
   */
  logout(): void {
    sessionStorage.removeItem('authToken'); // Xóa token khỏi sessionStorage
    sessionStorage.removeItem('userInfo'); // Xóa thông tin người dùng khỏi sessionStorage
    sessionStorage.removeItem('tokenExpiration'); // Xóa thời gian hết hạn của token
    sessionStorage.removeItem('refreshToken'); // Xóa refreshToken
    sessionStorage.removeItem('refreshTokenExpiration'); // Xóa thời gian hết hạn của refreshToken
    this.router.navigate(['/login']);
  }

  /**
   * Kiểm tra nếu người dùng đã đăng nhập
   * @returns true nếu người dùng đã đăng nhập, false nếu chưa
   */
  isLoggedIn(): boolean {
    return !!this.getToken();
  }

  /**
   * Lấy token từ sessionStorage
   * @returns Token nếu có, null nếu không có
   */
  getToken(): string | null {
    return sessionStorage.getItem('authToken');
  }

  /**
   * Lưu token vào sessionStorage
   * @param token Token nhận được từ server sau khi đăng nhập
   */
  setToken(token: string): void {
    sessionStorage.setItem('authToken', token);
  }

  /**
   * Lưu thông tin người dùng vào sessionStorage
   * @param userInfo Thông tin người dùng nhận được từ server
   */
  setUserInfo(userInfo: any): void {
    sessionStorage.setItem('userInfo', JSON.stringify(userInfo));
  }

  /**
   * Lưu thời gian hết hạn của token vào sessionStorage
   * @param expirationTime Thời gian hết hạn của token
   */
  setTokenExpiration(expirationTime: string): void {
    sessionStorage.setItem('tokenExpiration', expirationTime);
  }

  /**
   * Lưu refresh token vào sessionStorage
   * @param refreshToken Refresh token nhận được từ server
   */
  setRefreshToken(refreshToken: string): void {
    sessionStorage.setItem('refreshToken', refreshToken);
  }

  /**
   * Lưu thời gian hết hạn của refresh token vào sessionStorage
   * @param expirationTime Thời gian hết hạn của refresh token
   */
  setRefreshTokenExpiration(expirationTime: string): void {
    sessionStorage.setItem('refreshTokenExpiration', expirationTime);
  }

  /**
   * Lấy thông tin người dùng từ token
   * @returns Thông tin người dùng từ token (nếu có)
   */
  getUserFromToken(): any {
    const token = this.getToken();
    if (token) {
      const payload = token.split('.')[1];
      return JSON.parse(atob(payload));
    }
    return null;
  }

  /**
   * Xử lý lỗi của các yêu cầu HTTP
   * @param error Lỗi nhận được từ HTTP
   * @returns Observable lỗi
   */
  private handleError(error: any): Observable<never> {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Lỗi từ phía client
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Lỗi từ phía server
      errorMessage = `Error Code: ${error.status},  Message: ${error.message}`;
    }
    return throwError(errorMessage);
  }
}
