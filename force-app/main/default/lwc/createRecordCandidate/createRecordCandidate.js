import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import CANDIDATE_OBJECT from '@salesforce/schema/Candidate__c';
import STATUS_FIELD from '@salesforce/schema/Candidate__c.Status__c';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordCandidate extends LightningElement {
    statusOptions = []; //to store status picklist values
    formdata = {}; //to store fieldApiName Vs Value

    changeHandler(event){
        const fieldApiName = event.target.name; //name attribute value
        let value;
        if(fieldApiName === "Is_the_Resume_Good__c"){ //we can get the value from checkbox field using "checked" attribute
            value = event.target.checked;
        } else {
            value = event.target.value;
        }
        this.formdata[fieldApiName] = value; //add field api name and value dynamically
        console.log(JSON.stringify(this.formdata));
    }

    cancelHandler(){
        this.template.querySelector("form").reset();
        this.template.querySelector("lightning-combobox").value = undefined;
    }

    createRecordHandler(){
        //Prepare recordInput
        const recordInput = {
            apiName: CANDIDATE_OBJECT.objectApiName,
            fields: this.formdata
        };

        //call create record function
        createRecord(recordInput)
            .then(result => {
                const toast = new ShowToastEvent({
                    title: "Success",
                    message: "Candidate record has been saved successfully!",
                    variant: "success"
                });
                this.dispatchEvent(toast);
            })
            .catch(error => {
                const toast = new ShowToastEvent({
                    title: "Error",
                    message: error.detail.message,
                    variant: "error"
                });
                this.dispatchEvent(toast);
            })
    }

    //Get Default Record Type ID
    @wire(getObjectInfo, {objectApiName: CANDIDATE_OBJECT})
    candidateInfo;

    //Get the picklist values of Status field
    @wire(getPicklistValues, {
        fieldApiName: STATUS_FIELD,
        recordTypeId: '$candidateInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}){
        if(data){
            this.statusOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }
}