import { LightningElement } from 'lwc';
import CANDIDATE_OBJECT from '@salesforce/schema/Candidate__c';
import NAME_FIELD from '@salesforce/schema/Candidate__c.Name';
import EMAIL_FIELD from '@salesforce/schema/Candidate__c.Email__c';
import INTERVIEW_DATE_FIELD from '@salesforce/schema/Candidate__c.Interview_Date__c';
import STATUS_FIELD from '@salesforce/schema/Candidate__c.Status__c';
import SALARY_FIELD from '@salesforce/schema/Candidate__c.Annual_Salary__c';
import JD_FIELD from '@salesforce/schema/Candidate__c.Joining_Date__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditFormCandidate extends LightningElement {
    objectName = CANDIDATE_OBJECT;
    recordId = "a02IR00003VO8IGYA1";
    fields = {
        name: NAME_FIELD,
        email: EMAIL_FIELD,
        interviewDate: INTERVIEW_DATE_FIELD,
        status: STATUS_FIELD,
        salary: SALARY_FIELD,
        jd: JD_FIELD
    };

    successHandler(){
        const toast = new ShowToastEvent({
            title: "Success!",
            message: "Candidate record has been saved successfully",
            variant: "success",
            mode: "sticky"
        });
        this.dispatchEvent(toast);
    }
}