import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecordAccount extends LightningElement {
    industryOptions = []; //to store industry picklist values
    formdata = {}; //to store field api name vs value

    //Get the field api name vs value
    changeHandler(event){
        const fieldApiName = event.target.name;
        const value = event.target.value;
        this.formdata[fieldApiName] = value;
        console.log(JSON.stringify(this.formdata));
    }

    //reset the form data
    cancelHandler(){
        this.template.querySelector("form").reset();
        this.template.querySelector("lightning-combobox").value = undefined;
        this.template.querySelector("lightning-textarea").value = undefined;
    }

    createHandler(){
        if(this.formdata.AnnualRevenue > 2000000){
            this.formdata["Rating"] = "Hot";
        }
        //Prepare recordInput
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: this.formdata
        };

        //call create record function
        createRecord(recordInput)
            .then(result => {
                const toast = new ShowToastEvent({
                    title: "Success",
                    message: "Account record has been saved successfully!",
                    variant: "success"
                });
                this.dispatchEvent(toast);
                this.cancelHandler();
            })
            .catch(error => {
                console.error(error);
                const toast = new ShowToastEvent({
                    title: "Error",
                    message: error.body.message,
                    variant: "error"
                });
                this.dispatchEvent(toast);
            })
    }

    //Get account object information (metadata)
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo;

    //Get Industry picklist values (metadata)
    @wire(getPicklistValues, {
        fieldApiName: INDUSTRY_FIELD,
        recordTypeId: '$accountInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}){
        if(data){
            this.industryOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }
}