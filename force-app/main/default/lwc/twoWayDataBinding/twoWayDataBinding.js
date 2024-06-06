import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = "John Jones";
    title = "Salesforce Developer";

    changeHandler(event){
        this.title = event.target.value;
    }
}