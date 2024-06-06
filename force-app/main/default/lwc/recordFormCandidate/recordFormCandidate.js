import { LightningElement } from 'lwc';
import CANDIDATE_OBJECT from '@salesforce/schema/Candidate__c';
import NAME_FIELD from '@salesforce/schema/Candidate__c.Name';
import EMAIL_FIELD from '@salesforce/schema/Candidate__c.Email__c';
import INTERVIEW_DATE_FIELD from '@salesforce/schema/Candidate__c.Interview_Date__c';
import STATUS_FIELD from '@salesforce/schema/Candidate__c.Status__c';
import SALARY_FIELD from '@salesforce/schema/Candidate__c.Annual_Salary__c';
import JD_FIELD from '@salesforce/schema/Candidate__c.Joining_Date__c';

export default class RecordFormCandidate extends LightningElement {
    objectName = CANDIDATE_OBJECT;
    recordId = "a02IR00003VO8IGYA1";
    fields = [
        NAME_FIELD,
        EMAIL_FIELD,
        INTERVIEW_DATE_FIELD,
        STATUS_FIELD,
        SALARY_FIELD,
        JD_FIELD
    ];
}