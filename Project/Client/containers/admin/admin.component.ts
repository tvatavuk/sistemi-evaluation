import { Component, OnInit, ChangeDetectionStrategy } from "@angular/core";
import { ActivatedRoute, Router } from '@angular/router';
import { ISlider,IContent, SliderService, ContentService } from "app-shared";
import { FileRestrictions } from '@progress/kendo-angular-upload'

@Component({
    selector: 'app-admin',
    templateUrl: './admin.component.html'

})
export class AdminComponent implements OnInit {
    public appState: string = "";
    public item: any;
    public title :string = "";
    public typeOfContent: string = "";
    public showDialog: boolean = false;
    public oldImage: string = "";

    public fileRestrictions: FileRestrictions = {
        allowedExtensions: [".jpg", ".png"]
    };


    constructor(private _route: ActivatedRoute, private _sliderService: SliderService, private _contentService: ContentService, private _router: Router) {
        this.item = <any>{};
    }

    public confirmed(status: boolean): void {
        if (status) {
            if (this.appState.includes("Slider")) {
                this.deleteSlider();
            }
            else {
                this.deleteContent();
            }
        } else {
            this.showDialog = false;
        }
     
    }
    public openDialog() {
        this.showDialog = true;
    }
    ngOnInit() {
        let id = this._route.snapshot.params['id'];
        this.appState = this._route.snapshot.params['type'];

        switch (this.appState) {
            case 'editSlider':
                this.typeOfContent = "Slider";
                this.title = "Update existing slider";
                this._sliderService.getById(id).subscribe((res: ISlider) => { console.log(res); this.item = res; this.oldImage = this.item.image;}, (errors: string[]) => { console.log(errors); });
                break;
            case 'createSlider':
                this.title = "Create new slider";
                this.typeOfContent = "Slider";
                break;
            case 'editContent':
                this.title = "Update existing content";
                this.typeOfContent = "Content";
                this._contentService.getById(id).subscribe((res: IContent) => { console.log(res); this.item = res; this.oldImage = this.item.image; }, (errors: string[]) => { console.log(errors); });
                break;
            case 'createContent':
                this.title = "Create new content";
                this.typeOfContent = "Content";
                break;
        }
    }

    public updateSlider(): void {
        console.log("UPDEJTING", this.item.id, this.item);       
        this._sliderService.update(this.item.id, this.item).subscribe((res: any) => { this._router.navigate(["/home"]); }, (errors: string[]) => { console.log(errors); });
    }

    public deleteSlider() : void {
        console.log("DELETING", this.item.id, this.item);
        this.showDialog = false;
        this._sliderService.delete(this.item.id).subscribe((res: any) => { this._router.navigate(["/home"]); }, (errors: string[]) => { console.log(errors); });
    }

    public createSlider() : void{
        console.log(this.item.image[0].rawFile);
        this._sliderService.create(this.item).subscribe((res: any) => {
            this._router.navigate(["/home"])
        }, (errors: string[]) => { console.log(errors); });
    }

    public updateContent(): void {
        console.log("UPDEJTING", this.item.id, this.item);
        this._contentService.update(this.item.id, this.item).subscribe((res: any) => { this._router.navigate(["/home"]); }, (errors: string[]) => { console.log(errors); });
    }

    public deleteContent() {
        console.log("DELETING", this.item.id, this.item);
        this.showDialog = false;
        this._contentService.delete(this.item.id).subscribe((res: any) => { this._router.navigate(["/home"]); }, (errors: string[]) => { console.log(errors); });
    }

    public createContent() {
        console.log(this.item.image[0].rawFile);
        this._contentService.create(this.item).subscribe((res: any) => {
            this._router.navigate(["/home"])
        }, (errors: string[]) => { console.log(errors); });
    }


}
