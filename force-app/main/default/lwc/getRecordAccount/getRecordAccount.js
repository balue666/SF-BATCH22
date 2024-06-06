import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';

const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, RATING_FIELD, WEBSITE_FIELD];

export default class GetRecordAccount extends LightningElement {
    recordId = "001IR00001pq0n7YAA";

    name;
    type;
    industry;
    revenue;
    rating;
    website;

    /******* Approach 1 *******/
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.name = data.fields.Name.value;
            this.type = data.fields.Type.value;
            this.industry = data.fields.Industry.value;
            this.revenue = data.fields.AnnualRevenue.displayValue;
            this.rating = data.fields.Rating.value;
            this.website = data.fields.Website.value;
        }
        if(error){
            console.error(error);
        }
    }
    /******************************/

    /********** Approach 2 ********/
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.name = getFieldValue(data, NAME_FIELD);
            this.type = getFieldValue(data, TYPE_FIELD);
            this.industry = getFieldValue(data, INDUSTRY_FIELD);
            this.revenue = getFieldDisplayValue(data, REVENUE_FIELD);
            this.rating = getFieldValue(data, RATING_FIELD);
            this.website = getFieldValue(data, WEBSITE_FIELD);
        }
        if(error){
            console.error(error);
        }
    }
    /******************************/

}