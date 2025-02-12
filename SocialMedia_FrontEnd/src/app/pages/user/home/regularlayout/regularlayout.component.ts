import { Component, Input } from '@angular/core';
import { SidebarComponent } from '../../../sidebar/sidebar.component';
import { PostComponent } from '../../post/post.component';

@Component({
  selector: 'app-regularlayout',
  standalone: true,
  imports: [SidebarComponent, PostComponent],
  templateUrl: './regularlayout.component.html',
  styleUrl: './regularlayout.component.scss',
})
export class RegularlayoutComponent {}
