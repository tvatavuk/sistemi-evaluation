import { SwiperConfigInterface } from 'angular2-swiper-wrapper';

export const SWIPER_CONFIG: SwiperConfigInterface = {
    scrollbar: null,
    direction: 'horizontal',
    slidesPerView: 1,
    scrollbarHide: false,
    keyboardControl: true,
    mousewheelControl: true,
    scrollbarDraggable: true,
    scrollbarSnapOnRelease: true,
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    loop: false
};
