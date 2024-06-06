import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPicklistValuesAccount extends LightningElement {

    typeOptions = [];
    industryOptions = [];

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo; //mapping the result of wire service into a property - result is an object which contains data, error properties

    @wire(getPicklistValuesByRecordType, {
        objectApiName: ACCOUNT_OBJECT,
        recordTypeId: '$accountInfo.data.defaultRecordTypeId' 
    }) picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.industryOptions = data.picklistFieldValues.Industry.values;
        }
        if(error){
            console.error(error);
        }
    }
}