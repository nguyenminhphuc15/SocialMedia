import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegularlayoutComponent } from './regularlayout.component';

describe('RegularlayoutComponent', () => {
  let component: RegularlayoutComponent;
  let fixture: ComponentFixture<RegularlayoutComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RegularlayoutComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RegularlayoutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
