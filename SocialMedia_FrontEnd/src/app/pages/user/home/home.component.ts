import { Component, HostListener, signal, Signal } from '@angular/core';
import { SidebarComponent } from '../../sidebar/sidebar.component';
import { NavbarComponent } from '../../mobilebar/navbar/navbar.component';
import { PostComponent } from '../post/post.component';
import { FooterComponent } from '../../mobilebar/footer/footer.component';
import { CommonModule } from '@angular/common';
import { RegularlayoutComponent } from './regularlayout/regularlayout.component';
import { MobilelayoutComponent } from './mobilelayout/mobilelayout.component'; // Thêm CommonModule

@Component({
  selector: 'app-home',
  standalone: true, // Thêm standalone
  imports: [CommonModule, RegularlayoutComponent, MobilelayoutComponent],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent {
  isSmallScreen: boolean;
  constructor() {
    this.isSmallScreen = window.innerWidth <= 765;
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: { target: { innerWidth: number } }) {
    this.isSmallScreen = event.target.innerWidth <= 765;
  }
}
