import { LightningElement, api } from 'lwc';

export default class SliderComp extends LightningElement {
    @api val;

    @api resetSlider(){
        this.val = 50;
    }
}