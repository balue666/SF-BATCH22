@RestResource(urlMapping='/Case/*')
global with sharing class CaseManager {
    //https://sfbatch22-dev-ed.my.salesforce.com/services/apexrest/Case/*
    //https://sfbatch22-dev-ed.my.salesforce.com/services/apexrest/Case/500IR00001E1rGkYAJ

    //user sends case id in the endpoint. We need to return case, account & contact details
    //child with parent query
    @HttpGet
    global static Case getCaseInfo(){
        RestRequest request = RestContext.request; //This returns complete request details (RestRequest)
        String endpoint = request.requestURI; //endpoint set in the callout
        Integer lastIndex = endpoint.lastIndexOf('/'); //position or index of /
        Id caseId = endpoint.substring(lastIndex+1); //Id starts from the next position of /
        try {
            Case cs = [SELECT Id, CaseNumber, Subject, Priority, Origin, Status, Description, 
                Account.Name, Account.Type, Account.Industry, Account.Rating,
                Contact.Name, Contact.Title, Contact.Department, Contact.Email
                FROM Case
                WHERE Id = :caseId];
            return cs;
        } catch(Exception ex){
            throw new RecordNotFoundException('Record doesnt exist. Please send a valid case ID'); //throws exception in case user sends bad id
        }
    }
}