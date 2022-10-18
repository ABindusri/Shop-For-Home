import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductplacedComponent } from './productplaced.component';

describe('ProductplacedComponent', () => {
  let component: ProductplacedComponent;
  let fixture: ComponentFixture<ProductplacedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProductplacedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProductplacedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
