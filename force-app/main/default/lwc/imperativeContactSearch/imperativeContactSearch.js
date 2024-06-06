import { LightningElement } from 'lwc';
import getMatchingContacts from '@salesforce/apex/ContactCtrl.getMatchingContacts';

const COLUMNS = [
    {label: "Contact Name", fieldName: "Name", type: "text"},
    {label: "Title", fieldName: "Title", type: "text"},
    {label: "Department", fieldName: "Department", type: "text"},
    {label: "Email", fieldName: "Email", type: "email"},
    {label: "Phone", fieldName: "Phone", type: "phone"}
];

export default class ImperativeContactSearch extends LightningElement {
    contacts; //to store search results
    columns = COLUMNS; //table column properties

    //get the entered search key and pass the same to apex to get matching contacts
    handleSearch(event){
        const searchWord = event.target.value;
        if(searchWord.length > 0){
            getMatchingContacts({searchKey: searchWord})
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                console.error(error);
            })
        } else {
            this.contacts = undefined;
        }
    }
}