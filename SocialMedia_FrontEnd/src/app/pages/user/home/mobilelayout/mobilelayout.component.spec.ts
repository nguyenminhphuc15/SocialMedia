import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MobilelayoutComponent } from './mobilelayout.component';

describe('MobilelayoutComponent', () => {
  let component: MobilelayoutComponent;
  let fixture: ComponentFixture<MobilelayoutComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MobilelayoutComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MobilelayoutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
