import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import getTopOpps from '@salesforce/apex/OpportunityCtrl.getTopOpps';

export default class ImperativeOppSearch extends LightningElement {
    stageOptions = []; //to store stage picklist values
    opps; //to store search results
    info; //to store informational message

    //get default record type id
    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo;

    //get picklist values
    @wire(getPicklistValues, {
        fieldApiName: STAGE_FIELD,
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}){
        if(data){
            this.stageOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    //input the selected stage to apex method
    //to get all opps under that stage
    handleSearch(event){
        const selectedStage = event.target.value;
        getTopOpps({stage: selectedStage})
        .then(result => {
            //check if result has at least one opp record
            if(result.length > 0){
                this.opps = result;
                this.info = undefined;
            } else {
                this.info = "No opportunities are available under the selected stage!";
                this.opps = undefined;
            }
        })
        .catch(error => {
            console.error(error);
        })

    }
}