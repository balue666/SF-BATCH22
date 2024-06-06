import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {
    showModal = false; //to control the visibility of child component
    receivedMsg; //to store received message from child comp

    showHandler(){
        this.showModal = true;
    }

    closeHandler(event){
        this.showModal = false;
        this.receivedMsg = event.detail;
    }
}