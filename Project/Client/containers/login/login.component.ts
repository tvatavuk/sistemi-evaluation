import { Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { Component, OnInit } from '@angular/core';

import { AppState, LOGIN_USER } from 'app';

// Demo model
export class UserModel {
    username: string;
    password: string;
}

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {

    user: UserModel = new UserModel();

    // Use "constructor"s only for dependency injection
    constructor(private router: Router, private store: Store<AppState>) { }

    // Here you want to handle anything with @Input()'s @Output()'s
    // Data retrieval / etc - this is when the Component is "ready" and wired up
    ngOnInit() {

    }

    submitUser() {

        this.store.dispatch({
            type: LOGIN_USER,
            payload: this.user
        });

        console.log(this.store);

        this.router.navigate(['/']);
    }

}
