import { Injectable } from "@angular/core";
import { Observable } from "rxjs/Observable";
import { Response, Http, Headers, RequestOptions } from "@angular/http";
import "rxjs/add/operator/map";
import "rxjs/add/operator/catch";
import "rxjs/add/observable/throw";
import { IContent } from "./content.model";

@Injectable()
export class ContentService {
    headers: Headers;
    options: RequestOptions;
    constructor(private _http: Http) {

        this.headers = new Headers({ "Content-Type": "application/json" });
        this.options = new RequestOptions({ headers: this.headers });
    };

    public get(): Observable<any> {
        return this._http.get("api/content")
            .map((res: Response) => { console.log(res); return res.json(); })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }
    public getById(id: number): Observable<any> {
        return this._http.get("api/content/" + id)
            .map((res: Response) => { console.log(res); return res.json(); })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }

    public update(id: number, model: any): Observable<any> {
        let formFile = new FormData();
        let qs = "api/content?Id=" + model.id +
            "&Title=" + encodeURIComponent(model.title) +
            "&Description=" + encodeURIComponent(model.description);
        if (Array.isArray(model.image)) {
            formFile.append("file", model.image[0].rawFile);
            console.log("raw file", true);
        } else {
            formFile.append("file", null);
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
        return this._http.delete("api/content/" + id)
            .map((res: Response) => { console.log(res); return res.json(); })
            .catch((error: any) => { console.log(error); return Observable.throw(error); })
    }

    public create(model: any): Observable<any> {
        let formFile = new FormData();
        if (Array.isArray(model.image)) {
            formFile.append("file", model.image[0].rawFile);
        } else {
            formFile.append("file", null);
        }
        return this._http.post("api/content?Title=" + model.title +
            "&Description=" + model.description, formFile)
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
    public upload(file: any) {
        this.headers = new Headers({ "Content-Type": "multipart/form-data" });
        this.options = new RequestOptions({ headers: this.headers });
        return this._http.post("api/content/", file, this.options)
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