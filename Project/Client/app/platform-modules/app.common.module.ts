/*
 * _Common_ NgModule to share between our "BASE" App.Browser & App.Server module platforms
 *
 *  If something belongs to BOTH, just put it Here.
 * - If you need something to be very "platform"-specific, put it
 *   in the specific one (app.browser or app.server)
 */
import { NgModule } from '@angular/core';
// import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';
import { Jsonp, JsonpModule } from '@angular/http';
import { Store, StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';

// swiper wrapper
import { SwiperModule, SwiperConfigInterface } from 'angular2-swiper-wrapper';

// Kendo stuff
// import { GridModule } from '@progress/kendo-angular-grid';
import { UploadModule } from '@progress/kendo-angular-upload';
import { DialogModule } from '@progress/kendo-angular-dialog';

// ck editor module
import { CKEditorModule } from 'ng2-ckeditor';

// ng2 bootstrap
import { Ng2BootstrapModule } from 'ng2-bootstrap';

// Main "APP" Root Component
import { BaseSharedModule, AppComponent, SWIPER_CONFIG, ROUTES, appReducer } from 'app';

// Component imports
import { NavMenuComponent, FooterComponent, SwiperComponent_Sis, ContentDnnComponent, ContentProjectComponent, ContentLocationComponent, ContentServicesComponent, ContentContactComponent } from 'app-components';

// Container (aka: "pages") imports
import {
    HomeComponent,
    LoginComponent,
    NotFoundComponent,
    AdminComponent,
    ContactComponent,
    ServicesComponent
} from 'app-containers';

// Provider (aka: "shared" | "services") imports
import {
    HttpCacheService, CacheService, // Universal : XHR Cache
    ApiGatewayService,
    RxContextDirective,
    Meta,
    SliderService,
    ContentService,
    AdminGuard
} from 'app-shared';

//////////////////////////////////////////////////////////////////

// This imports the variable that, in a hot loading situation, holds
// a reference to the previous application's last state before
// it was destroyed.
import { appState } from 'app';

const MODULES = [
    // Do NOT include UniversalModule, HttpModule, or JsonpModule here

    // This has ALL the "Common" stuff (CommonModule, FormsModule, ReactiveFormsModule, etc etc)
    // You would import this into your child NgModules so you don't need to duplicate so much code
    BaseSharedModule,
    // Angular
    RouterModule,
    JsonpModule,
    // NgRx
    StoreModule.provideStore(appReducer, appState),
    EffectsModule,
    // Swiper module
    SwiperModule.forRoot(SWIPER_CONFIG),

    // Kendo Modules
    UploadModule,
    DialogModule,
    // ng2 Bootstrap
    Ng2BootstrapModule.forRoot(),
    // CkEditorModule
    CKEditorModule,
    // Routing
    RouterModule.forRoot(ROUTES),
];

const PIPES = [
    // put pipes here
];

const COMPONENTS = [
    // put shared components here
    AppComponent,
    NavMenuComponent,
    FooterComponent,
    HomeComponent,
    LoginComponent,
    NotFoundComponent,
    ContactComponent,
    ServicesComponent,
    ContentDnnComponent,
    ContentProjectComponent,
    ContentLocationComponent,
    ContentServicesComponent,
    ContentContactComponent,
    AdminComponent,
    SwiperComponent_Sis,
    // Directives
    RxContextDirective,

];

const PROVIDERS = [
    // put shared services here
    CacheService,
    HttpCacheService,
    ApiGatewayService,
    SliderService,
    ContentService,
    AdminGuard,
    Meta, // MetaService is a cross platform way to change title, and update anything in the <head>

];

@NgModule({
    // bootstrap: [AppComponent],
    imports: [
        ...MODULES
    ],
    declarations: [
        ...PIPES,
        ...COMPONENTS
    ],
    providers: [
        ...PROVIDERS
    ]
})
export class AppCommonModule { }
