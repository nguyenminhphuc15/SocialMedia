import { Component } from '@angular/core';
import { AuthService } from '../../../core/services/auth/auth.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { FooterComponent } from '../../../layout/footer/footer.component';
import { FormsModule } from '@angular/forms';
@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FooterComponent, FormsModule], // Import FooterComponent nếu cần thiết cho layout
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  email: string = ''; // Khai báo email
  password: string = ''; // Khai báo password

  constructor(
    private authService: AuthService, // Inject AuthService để gọi API đăng nhập
    private router: Router // Inject Router để chuyển hướng sau khi đăng nhập thành công
  ) {}

  onLogin(): void {
    // Kiểm tra email và password trước khi gửi yêu cầu đăng nhập
    if (!this.email || !this.password) {
      Swal.fire({
        icon: 'warning',
        title: 'Thông tin chưa đầy đủ',
        text: 'Vui lòng nhập cả email và mật khẩu!',
        confirmButtonText: 'OK',
      });
      return;
    }
    this.authService.login(this.email, this.password).subscribe(
      (response) => {
        console.log('Login successful', response);

        // Hiển thị thông báo đăng nhập thành công
        Swal.fire({
          icon: 'success',
          title: 'Đăng nhập thành công',
          text: 'Chào mừng bạn đến với trang chủ!',
          confirmButtonText: 'OK',
        }).then((result) => {
          if (result.isConfirmed) {
            // Chuyển hướng người dùng đến trang chủ
            this.router.navigate(['/home']);
          }
        });
      },
      (error) => {
        console.error('Login failed', error);

        // Hiển thị thông báo đăng nhập thất bại
        Swal.fire({
          icon: 'error',
          title: 'Đăng nhập thất bại',
          text: 'Vui lòng kiểm tra lại thông tin đăng nhập của bạn.',
          confirmButtonText: 'OK',
        });
      }
    );
  }
}
