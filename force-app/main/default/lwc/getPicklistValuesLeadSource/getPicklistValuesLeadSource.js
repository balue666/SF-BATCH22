import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetPicklistValuesLeadSource extends LightningElement {
    options = []; //to store lead source picklist values
    selectedValue; //to store selected lead source value
    customerConId; //to store customer contact record type id

    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    contactInfoHandler({data, error}){
        if(data){
            console.log(data);
            this.customerConId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues, {
        fieldApiName: LEADSOURCE_FIELD,
        recordTypeId: '$customerConId' //reactive property: wire re-runs for every change in the value
    }) picklistHandler({data, error}){
        if(data){
            this.options = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    changeHandler(event){
        this.selectedValue = event.target.value;
    }
}