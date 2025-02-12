import { Component, HostListener, Input } from '@angular/core';
import { SearchComponent } from '../user/search/search.component';
import { CommonModule } from '@angular/common';

// import { Router } from '@angular/router';
// import { LogoutService } from '../../services/logout.service';
// import { BiLogOut } from 'react-icons/bi'; // Thực tế không sử dụng react-icons trong Angular, bạn có thể thay bằng icon tương ứng trong Angular

@Component({
  selector: 'app-sidebar',
  standalone: true,
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss'],
  imports: [CommonModule, SearchComponent],
})
export class SidebarComponent {
  isMediumWidth = false;
  isShowSearch = false;
  isMediaUnder1265 = false;
  onShowSearch() {
    this.isShowSearch = !this.isShowSearch;

    this.isMediumWidth = !this.isMediaUnder1265
      ? this.isShowSearch
      : this.isMediumWidth;
  }
  @HostListener('window:resize', ['$event'])
  onResize(event: { target: { innerWidth: number } }) {
    this.isMediaUnder1265 = event.target.innerWidth <= 1265;
    this.isMediumWidth = this.isShowSearch
      ? this.isMediumWidth
      : this.isMediaUnder1265;
  }
}
