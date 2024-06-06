@RestResource(urlMapping='/Opps/*')
global with sharing class OpportunityManager {
    //https://sfbatch22-dev-ed.my.salesforce.com/services/apexrest/Opps/*
    //https://sfbatch22-dev-ed.my.salesforce.com/services/apexrest/Opps/001IR00001pq0n7YAA

    //User sends account id in the endpoint. You need return account and all opportunities
    @HttpGet
    global static Account getAccountOpps(){
        RestRequest request = RestContext.request; //This returns complete request details (RestRequest)
        String endpoint = request.requestURI; //endpoint set in the callout
        Integer lastIndex = endpoint.lastIndexOf('/'); //position or index of /
        Id accId = endpoint.substring(lastIndex+1); //Id starts from the next position of /
        try {
            Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue, Rating,
                (SELECT Id, Name, Type, StageName, Amount, CloseDate FROM Opportunities)
                FROM Account
                WHERE Id = :accId];
            return acc;
        } catch(Exception ex){
            throw new RecordNotFoundException('Record doesnt exist. Please send a valid account ID'); //throws exception in case user sends bad id
        }
    }
}