import { LightningElement, wire } from 'lwc';
import SI_CHANNEL from '@salesforce/messageChannel/SoftInnovas__c';
import { APPLICATION_SCOPE, MessageContext, subscribe } from 'lightning/messageService';

export default class LmsSubscriber extends LightningElement {
    receivedMessage; //to store the received message

    @wire(MessageContext)
    context;

    //connectedCallback is a component lifecycle hook
    //It gets invoked by LWC Engine when the component is getting added to the page
    connectedCallback(){
        this.subscribeHandler();
    }

    //subscribes to the message channel
    subscribeHandler(){
        subscribe(
            this.context,
            SI_CHANNEL,
            (message) => { this.handleMessage(message) },
            { scope: APPLICATION_SCOPE }
        );
    }

    handleMessage(message){
        this.receivedMessage = message.lmsData;
    }
}