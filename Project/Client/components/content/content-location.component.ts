import { Component, OnInit } from "@angular/core";
import { Response } from "@angular/http";
import { IContent, ContentService } from "app-shared";
import { Store } from '@ngrx/store';
import { AppState, LOGOUT_USER } from 'app';

@Component({
    selector: 'app-location-content',
    templateUrl: './content-location.component.html',
    styleUrls: ['./content-location.component.css']
})
export class ContentLocationComponent implements OnInit {
    public item: any;
    public isLoaded: boolean = false;
    loggedIn$: {};
    user$: {};
    constructor(private _contentService: ContentService, private store: Store<AppState>) { }

    ngOnInit() {

        this._contentService.getById(5).subscribe((res: IContent) => { console.log(res); this.item = res; }, (errors: string[]) => { console.log(errors); });

        this.store.select('loggedIn').subscribe(loggedIn => {
            this.loggedIn$ = loggedIn;
        });

        this.store.select('loggedInUser').subscribe(user => {
            this.user$ = user;
        });

    }
}
