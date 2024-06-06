import { LightningElement, api } from 'lwc';

export default class DisplayResults extends LightningElement {
    @api result; //array of records to be displayed
    @api error; // if any errors
    @api columns; //columns information
}