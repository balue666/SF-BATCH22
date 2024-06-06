import { LightningElement, wire } from 'lwc';
import getTopOpps from '@salesforce/apex/OpportunityCtrl.getTopOpps';

export default class WiredApexTopOpps extends LightningElement {
    targetStage = 'Closed Won';
    opps; //to store received opps from apex call

    @wire(getTopOpps, {stage: '$targetStage'})
    oppHandler({data, error}){
        if(data){
            this.opps = data;
        }
        if(error){
            console.error(error);
        }
    }
}