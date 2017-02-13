import { Component, OnInit, Inject } from '@angular/core';
import { isBrowser } from 'angular2-universal';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html'
})
export class HomeComponent implements OnInit {

    title: string = 'Welcome to our website';

    // Use "constructor"s only for dependency injection
    constructor() {
        for (let name in window['CKEDITOR'].instances) {
            window['CKEDITOR'].instances[name].destroy();
            console.log("destroying");
        }
    }

    // Here you want to handle anything with @Input()'s @Output()'s
    // Data retrieval / etc - this is when the Component is "ready" and wired up
    ngOnInit() {
        console.log('Are we inside the Browser ? ' + isBrowser);
    }
}
