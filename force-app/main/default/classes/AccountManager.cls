@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {
    //https://sfbatch22-dev-ed.my.salesforce.com/services/apexrest/Account/*
    //https://sfbatch22-dev-ed.my.salesforce.com/services/apexrest/Account/001IR00001pq0n7YAA

    //When someone wants to get account details, they do send account id in the request URI and make a GET callout 
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request; //This returns complete request details (RestRequest)
        String endpoint = request.requestURI; //endpoint set in the callout
        Integer lastIndex = endpoint.lastIndexOf('/'); //position or index of /
        Id accId = endpoint.substring(lastIndex+1); //Id starts from the next position of /
        try {
            Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue, Rating FROM Account WHERE Id = :accId LIMIT 1];
            return acc; //returns the asked account details
        } catch(Exception ex){
            throw new RecordNotFoundException('Record doesnt exist. Please send a valid account ID'); //throws exception in case user sends bad id
        }
    }

    //When someone wants to post account details, they do send the information in the request body and make a POST callout
    @HttpPost
    global static Id postAccount(String Name, String Type, String Industry, Integer AnnualRevenue, String Rating){
        //The json values gets tied to the input parameters automatically provided the input variable names exactly match with json keys
        Account acc = new Account();
        acc.Name = Name; //left side: Object field api name, right side: input parameter
        acc.Type = Type;
        acc.Industry = Industry;
        acc.AnnualRevenue = AnnualRevenue;
        acc.Rating = Rating;
        insert acc;
        return acc.Id;
    }

    //When someone wants delete an account, they do send account id in the endpoint and make a DELETE callout
    @HttpDelete
    global static String deleteAccount(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id accId = endpoint.substring(lastIndex+1);
        try {
            Account acc = [SELECT Id FROM Account WHERE Id = :accId LIMIT 1];
            delete acc;
            return 'Success! Record has been deleted!';
        } catch(Exception ex){
            throw new RecordNotFoundException('Record doesnt exist. Please send a valid account ID'); //throws exception in case user sends bad id
        }
    }

    //When someone wants to upsert an account, they do send account details in the request body and make a PUT callout
    @HttpPut
    global static Account putAccount(){
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString(); //requestBody = Blob, hence using toString to convert Blob to string
        Account acc = (Account)JSON.deserialize(jsonString, Account.class); //Converting json string into account record
        upsert acc;
        return [SELECT Id, Name, Type, Industry, AnnualRevenue, Rating FROM Account WHERE Id = :acc.Id LIMIT 1];
    }

    //When someone wants to patch a few fields data, they do send them as request body and make a PATCH callout
    @HttpPatch
    global static Account patchAccount(){
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString(); //requestBody = Blob, hence using toString to convert Blob to string
        Map<String,Object> jsonData = (Map<String,Object>)JSON.deserializeUntyped(jsonString); //It converts the json string into a map of key value combination. json key is always a string, json value can be of any data type - hence taking the parent "object" data type
        Account acc = new Account();
        for(String key : jsonData.keySet()){ //the keys are field api names of account object
            acc.put(key, jsonData.get(key)); //acc.Name = 'Test Account' === acc.put('Name', 'Test Account');
        }
        update acc;
        return [SELECT Id, Name, Type, Industry, AnnualRevenue, Rating FROM Account WHERE Id = :acc.Id LIMIT 1];
    }
}