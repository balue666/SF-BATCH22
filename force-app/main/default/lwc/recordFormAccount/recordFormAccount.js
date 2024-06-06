import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

export default class RecordFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    recordId = "001IR00001pq0n7YAA";
    fields = [
        NAME_FIELD,
        TYPE_FIELD,
        INDUSTRY_FIELD,
        REVENUE_FIELD,
        RATING_FIELD,
        WEBSITE_FIELD
    ];
}