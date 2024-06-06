import { LightningElement, api } from 'lwc';

export default class DisplayStudent extends LightningElement {
    @api stdName;
    @api stdAge;
    @api stdStay;
}