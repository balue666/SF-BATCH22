import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPicklistValuesIndustry extends LightningElement {
    industryOptions = []; //to store all picklist values
    selectedIndustry; //to store selected picklist value
    accountRtId; //to store account record type id value

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accInfoHandler({data, error}){
        if(data){
            this.accountRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues, {
        fieldApiName: INDUSTRY_FIELD,
        recordTypeId: '$accountRtId' //reactive: wire runs again for every change in the value of accountRtId
    }) picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.industryOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    changeHandler(event){
        this.selectedIndustry = event.target.value;
    }
}