import { Injectable } from "@angular/core";
import { Observable } from "rxjs/Observable";
import { Response, Http, Headers, RequestOptions } from "@angular/http";
import "rxjs/add/operator/map";
import "rxjs/add/operator/catch";
import "rxjs/add/observable/throw";
import { ISlider } from "./slider.model";

@Injectable()
export class SliderService {
    headers: Headers;
    options: RequestOptions;
    constructor(private _http: Http) {

        this.headers = new Headers({ "Content-Type": "application/json" });
        this.options = new RequestOptions({ headers: this.headers });
    };

    public get(): Observable<any> {
        return this._http.get("api/slider")
            .map((res: Response) => { console.log(res); return res.json(); })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }

    public getById(id: number): Observable<any> {
        return this._http.get("api/slider/" + id)
            .map((res: Response) => { console.log(res); return res.json(); })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }

    public update(id: number, model: any): Observable<any> {
        let formFile = new FormData();
        let qs = "api/slider?Id=" + model.id +
            "&Title=" + encodeURIComponent(model.title) +
            "&linkText=" + encodeURIComponent(model.linkText) +
            "&linkUrl=" + encodeURIComponent(model.linkUrl) +
            "&Description=" + encodeURIComponent(model.description);
        if (Array.isArray(model.image)) {
            formFile.append("file", model.image[0].rawFile);
        } else {
            qs += "&image=" + model.image;
        }

        return this._http.put(qs, formFile)
            .map((res: Response) => {
                console.log(res);
                if (res.status === 204) {
                    return undefined;
                } else {
                    return res.json();
                }
            })
            .catch((error: any) => { console.log(error); return Observable.throw(error); });
    }

    public delete(id: number): Observable<any> {
        return this._http.delete("api/slider/" + id)
            .map((res: Response) => { console.log(res); return res.json(); })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }

    public create(model: any): Observable<any> {
        let formFile = new FormData();
        formFile.append("file", model.image[0].rawFile);
        return this._http.post("api/slider?Title=" + model.title +
            "&Description=" + model.description +
            "&linkText=" + model.linkText +
            "&linkUrl=" + model.linkUrl, formFile)
            .map((res: Response) => {
                console.log(res);
                if (res.status === 204) {
                    return undefined;
                } else {
                    return res.json();
                }
            })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }
}