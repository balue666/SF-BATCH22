import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showContent = false;
    buttonLabel = "Show Content";

    clickHandler(){
        this.showContent = !this.showContent;
        this.buttonLabel = (this.buttonLabel == "Show Content") ? "Hide Content" : "Show Content";
    }
}