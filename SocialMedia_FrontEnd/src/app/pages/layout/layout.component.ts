import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from '../navbar/navbar.component';
import { SidebarComponent } from '../sidebar/sidebar.component';
import { DashboardComponent } from '../dashboard/dashboard.component';

// Ensure Bootstrap JS is properly imported
declare var bootstrap: any;
@Component({
  selector: 'app-layout',
  standalone: true,
  templateUrl: './layout.component.html',
  styleUrl: './layout.component.scss',
  imports: [
    // CommonModule,
    // NavbarComponent,
    // SidebarComponent,
    // DashboardComponent,
  ],
})
export class LayoutComponent {
  title = 'admin-dashboard';
  isSidebarClosed = false;
  handleSidebarToggle(isClosed: boolean) {
    this.isSidebarClosed = isClosed;
  }
  openSettingsModal() {
    const settingsModal = new bootstrap.Modal(
      document.getElementById('settingsModal'),
      {
        keyboard: false,
      }
    );
    settingsModal.show();
  }
}
