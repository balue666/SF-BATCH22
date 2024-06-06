import { LightningElement, wire } from 'lwc';
import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Rating", fieldName: "Rating", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];

export default class WiredApexTopAccounts extends LightningElement {
    accounts; //to store the accounts to be displayed
    columns = COLUMNS; //to store the table column properties

    //Call apex to get top 5 accounts
    @wire(getTopAccounts)
    accountHandler({data, error}){
        if(data){
            this.accounts = data;
        }
        if(error){
            console.error(error);
        }
    }
}