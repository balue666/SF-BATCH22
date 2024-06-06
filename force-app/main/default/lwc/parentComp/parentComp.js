import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
    showHandler1(event){
        console.log("Parent Comp: Received event from Child");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }

    showHandler2(event){
        console.log("Parent Comp DIV: Received event from Child");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
}