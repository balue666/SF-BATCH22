import { LightningElement } from 'lwc';

export default class ProgressParent extends LightningElement {
    size; //to store the selected size value
    value; // to store entered progress value
    sizeOptions = [
        {label: "Large", value: "large"},
        {label: "Medium", value: "medium"},
        {label: "Small", value: "small"}
    ];

    changeHandler(event){
        if(event.target.label === "Select Size"){
            this.size = event.target.value;
        } else {
            this.value = event.target.value;
        }
    }
}