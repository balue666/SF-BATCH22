import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName = "Sunder Pichai"; //string
    age = 40; //number
    location = { //object
        city: "Houston",
        country: "United States"
    };
    colors = ["Green", "Blue", "Red", "White"]; //array
}