import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {
    products = [
        {
            Id: 1,
            Name: "iPhone 15",
            Price: 1200.00,
            Brand: "Apple",
            Category: "Smartphones"
        },
        {
            Id: 2,
            Name: "MacBook",
            Price: 2500.00,
            Brand: "Apple",
            Category: "Laptops"
        },
        {
            Id: 3,
            Name: "Apple Watch",
            Price: 500.00,
            Brand: "Apple",
            Category: "Smartwatches"
        }
    ];
}