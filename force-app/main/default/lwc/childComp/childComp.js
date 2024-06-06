import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {
    clickHandler(){
        console.log("Child Comp: Before dispatching the event");
        const showEvt = new CustomEvent('show', {bubbles: true, composed: true});
        this.dispatchEvent(showEvt);
        console.log("Child Comp: After dispatching the event");
    }
}