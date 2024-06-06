import { MessageContext, publish } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import SI_CHANNEL from '@salesforce/messageChannel/SoftInnovas__c';

export default class LmsPublisher extends LightningElement {
    value; //to store message to be published

    @wire(MessageContext)
    context;

    changeHandler(event){
        this.value = event.target.value;
    }

    //publish the message into the message channel
    publishHandler(){
        //prepare message
        const message = {
            lmsData: this.value
        };
        publish(this.context, SI_CHANNEL, message);
        console.log("message published");
    }
}