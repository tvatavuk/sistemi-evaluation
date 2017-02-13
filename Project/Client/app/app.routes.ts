import { Route } from '@angular/router';

// Container (aka: "pages") imports
import {
    HomeComponent,
    ContactComponent,
    ServicesComponent,
    LoginComponent,
    NotFoundComponent,
    AdminComponent
} from 'app-containers';
import {
    AdminGuard
} from 'app-shared'

export const ROUTES: Route[] = [
    // Base route
    { path: '', redirectTo: 'home', pathMatch: 'full' },

    // Other routes
    { path: 'home', component: HomeComponent, data: { title: 'Home' } },
    { path: 'services', component: ServicesComponent, data: { title: 'Services' } },
    { path: 'contact', component: ContactComponent, data: { title: 'Contact' } },
    { path: 'login', component: LoginComponent, data: { title: 'Login' } },
    { path: 'not-found', component: NotFoundComponent, data: { title: '404 - Not Found' } },
    { path: 'admin/:type/:id', component: AdminComponent, canActivate: [AdminGuard] },
    { path: 'admin/:type', component: AdminComponent, canActivate: [AdminGuard] },
    // All else fails - go home
    { path: '**', redirectTo: 'not-found' }
];
