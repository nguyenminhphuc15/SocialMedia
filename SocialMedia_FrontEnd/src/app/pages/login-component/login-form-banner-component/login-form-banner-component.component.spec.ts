import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LoginFormBannerComponentComponent } from './login-form-banner-component.component';

describe('LoginFormBannerComponentComponent', () => {
  let component: LoginFormBannerComponentComponent;
  let fixture: ComponentFixture<LoginFormBannerComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LoginFormBannerComponentComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LoginFormBannerComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
