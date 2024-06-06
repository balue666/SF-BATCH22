import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

export default class GetRecordCandidate extends LightningElement {
    candidateId = "a02IR00003VO8IGYA1";

    @wire(getRecord, {
        recordId: '$candidateId',
        layoutTypes: ['Full'],
        modes: ['View'] //You will get readonly fields as well (formulas, audit fields)
    }) candidate;
}