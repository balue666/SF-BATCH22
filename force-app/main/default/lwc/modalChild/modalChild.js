import { LightningElement } from 'lwc';

export default class ModalChild extends LightningElement {

    closeHandler(){
        //Simple Event Approach
        // console.log("Before creating & dispacting custom event");
        // const closeEvt = new CustomEvent('close');
        // this.dispatchEvent(closeEvt);
        // console.log("After dispacting custom event");

        //Event with data
        console.log("Before creating & dispacting custom event");
        let message = "Child comp is sending data";
        const closeEvt = new CustomEvent('close', {detail: message});
        this.dispatchEvent(closeEvt);
        console.log("After dispacting custom event");
    }
}