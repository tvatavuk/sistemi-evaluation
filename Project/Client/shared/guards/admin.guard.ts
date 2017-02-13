import { Injectable, OnInit } from "@angular/core";
import { Store } from '@ngrx/store';
import { AppState, LOGOUT_USER } from 'app';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from "@angular/router";

/**
 * Decides if a route can be activated.
 */
@Injectable() export class AdminGuard implements CanActivate, OnInit {
    constructor(private store: Store<AppState>, private router: Router) { }
    isLoggedIn= {};
    ngOnInit() { }
    public canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        let url: string = state.url;
        console.log(state, route);

        this.store.select('loggedIn').subscribe(loggedIn => {
            console.log("islogged gurard,", loggedIn);
            this.isLoggedIn = loggedIn;
        });
        console.log(this.isLoggedIn);
        if (this.isLoggedIn) {
            return true;
        } else {
            this.router.navigate(["/home"]);
            return false;
        }
       

    }

}
