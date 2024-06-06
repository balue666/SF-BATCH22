import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import CANDIDATE_OBJECT from '@salesforce/schema/Candidate__c';
import STATUS_FIELD from '@salesforce/schema/Candidate__c.Status__c';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class UpdateRecordCandidate extends LightningElement {
    candidateId = "a02IR00003VO8IGYA1";
    statusOptions = [];
    formdata = {};

    //get candidate record detail
    @wire(getRecord, {
        recordId: '$candidateId',
        layoutTypes: ['Full'],
        modes: ['View']
    }) candidate;

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

    //get field api name vs value
    changeHandler(event){
        const fieldApiName = event.target.name;
        const value = event.target.value;
        this.formdata[fieldApiName] = value;
    }

    updateRecordHandler(){
        //add id in the formdata
        this.formdata["Id"] = this.candidateId;

        //prepare recordInput
        const recordInput = {
            fields: this.formdata
        };

        //call update record function to update the record
        updateRecord(recordInput)
            .then(result => {
                const toast = new ShowToastEvent({
                    title: "Success!",
                    message: "Candidate record has been updated successfully!",
                    variant: "success"
                });
                this.dispatchEvent(toast);
            })
            .catch(error => {
                const toast = new ShowToastEvent({
                    title: "Error!",
                    message: error.body.message,
                    variant: "error"
                });
                this.dispatchEvent(toast);
            })
    }
}