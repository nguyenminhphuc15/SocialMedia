import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-search',
  imports: [CommonModule],
  templateUrl: './search.component.html',
  styleUrl: './search.component.scss',
})
export class SearchComponent {
  searchTerm: string = '';
  isSearch: boolean = false;
  onSearch(event: Event): void {
    const input = event.target as HTMLInputElement;
    this.searchTerm = input.value;
    if (this.searchTerm.trim()) {
      this.isSearch = true;
    } else {
      this.isSearch = false;
    }
    console.log(this.isSearch);
  }
}
