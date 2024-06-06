import { LightningElement, api } from 'lwc';

export default class ProgressBar extends LightningElement {
    @api progValue;
    @api progSize;
}