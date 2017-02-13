import { Component, ViewChild, OnInit } from '@angular/core';
import { ISlider, SliderService } from 'app-shared';
import { SwiperConfigInterface } from 'angular2-swiper-wrapper';
import { Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { AppState, LOGOUT_USER } from 'app';

@Component({
    selector: 'app-swiper',
    templateUrl: './swiper.component.html',
    styleUrls: ['./swiper.component.css']
})
export class SwiperComponent_Sis implements OnInit {
    private slides = [];
    public loggedIn$ = {};
    public user$ = {};
    constructor(private _sliderService: SliderService, private store: Store<AppState>, private _router: Router) {
        console.log("swiper component", this);
        this.onIndexChange(3);
    }

    ngOnInit() {
        this._sliderService.get().subscribe((res: ISlider[]) => { console.log(res); this.slides = res; }, (errors: string[]) => { console.log(errors); });

        this.store.select('loggedIn').subscribe(loggedIn => {
            this.loggedIn$ = loggedIn;
        });

        this.store.select('loggedInUser').subscribe(user => {
            this.user$ = user;
        });
    }
    private type: string = 'component';

    private config: SwiperConfigInterface = {
        scrollbar: null,
        direction: 'horizontal',
        slidesPerView: 1,
        scrollbarHide: false,
        keyboardControl: true,
        mousewheelControl: false,
        scrollbarDraggable: true,
        scrollbarSnapOnRelease: true,
        pagination: '.swiper-pagination',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        loop: false,
    };

    // @ViewChild(SwiperComponent) swiperView: SwiperComponent;

    toggleType() {
        this.type = this.type === 'component' ? 'directive' : 'component';
    }

    toggleDirection(): boolean {
        this.config.direction = (this.config.direction === 'horizontal') ? 'vertical' : 'horizontal';
        return false;
    }

    toggleAutoHeight() {
        this.config.autoHeight = !this.config.autoHeight;
    }

    toggleSlidesPerView() {
        if (this.config.slidesPerView !== 1) {
            this.config.slidesPerView = 1;
        } else {
            this.config.slidesPerView = +this.config.slidesPerView + 1;
        }
    }

    toggleOverlayControls() {
        if (this.config.pagination) {
            this.config.scrollbar = '.swiper-scrollbar';
            this.config.pagination = null;
            this.config.nextButton = null;
            this.config.prevButton = null;
        } else if (this.config.scrollbar) {
            this.config.scrollbar = null;
        } else {
            this.config.pagination = '.swiper-pagination';
            this.config.nextButton = '.swiper-button-next';
            this.config.prevButton = '.swiper-button-prev';
        }
    }

    toggleKeyboardControl() {
        this.config.keyboardControl = !this.config.keyboardControl;
    }

    toggleMouseWheelControl() {
        this.config.mousewheelControl = !this.config.mousewheelControl;
    }

    onReachEnd(event: any) {
        console.log('Swiper at the end!');
    }

    onIndexChange(index: number) {
        console.log('Swiper index: ' + index);
    }
}
