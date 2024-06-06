import { LightningElement } from 'lwc';

export default class ComboboxEmample extends LightningElement {
    categories = [
        {label: "Smartphone", value: "Smartphone"},
        {label: "Laptop", value: "Laptop"},
        {label: "Smartwatch", value: "Smartwatch"}
    ];
}