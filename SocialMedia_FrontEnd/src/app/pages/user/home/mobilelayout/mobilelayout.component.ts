import { Component } from '@angular/core';
import { FooterComponent } from '../../../mobilebar/footer/footer.component';
import { PostComponent } from '../../post/post.component';
import { NavbarComponent } from '../../../mobilebar/navbar/navbar.component';

@Component({
  selector: 'app-mobilelayout',
  imports: [FooterComponent, PostComponent, NavbarComponent],
  templateUrl: './mobilelayout.component.html',
  styleUrl: './mobilelayout.component.scss',
})
export class MobilelayoutComponent {}
