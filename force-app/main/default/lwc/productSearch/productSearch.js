import { LightningElement } from 'lwc';
import findProducts from '@salesforce/apex/ProductCtrl.findProducts';

const COLUMNS = [
    {label: "Title", fieldName: "Name", type: "text"},
    {label: "Brand", fieldName: "Brand__c", type: "text"},
    {label: "Category", fieldName: "Category__c", type: "text"},
    {label: "Price", fieldName: "Price__c", type: "number"},
];

export default class ProductSearch extends LightningElement {
    products; //to store search results
    columns = COLUMNS; //to store columns properties
    errors = "Enter a keyword to see the matching products"; //error/info messages

    //Apex call to get the matching results
    changeHandler(event){
        const searchWord = event.target.value;
        if(searchWord.length > 0){
            findProducts({searchKey: searchWord})
            .then(result => {
                if(result.length > 0){ //at least 1 result
                    this.products = result;
                    this.errors = undefined;
                } else { // no matching records
                    this.products = undefined;
                    this.errors = "No matching products found. Try different search!";
                }
            })
            .catch(error => {
                this.errors = error;
                this.products = undefined;
            })
        } else {
            this.products = undefined;
            this.errors = "No matching products found. Try different search!";
        }
    }
}