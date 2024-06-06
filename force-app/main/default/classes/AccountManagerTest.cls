@isTest
public with sharing class AccountManagerTest {
    @TestSetup
    private static void makeData(){
        //create account record - it will be useful to test GET, DELETE requests        
        Account acc = TestSuite.createAccount();
    }

    @isTest
    private static void postAccountTest(){
        Test.startTest();
        Id accId = AccountManager.postAccount('Test Name', 'Existing Customer', 'Biotechnology', 3000000, 'Hot');
        List<Account> acc = [SELECT Id FROM Account WHERE Id = :accId];
        Assert.areEqual(1, acc.size());
        Test.stopTest();
    }

    @isTest
    private static void getAccountTest(){
        //Prepare RestRequest
        Account acc = [SELECT Id, AnnualRevenue FROM Account LIMIT 1];
        String endpoint = URL.getOrgDomainURL().toExternalForm() + '/services/apexrest/Account/' + acc.Id; //domain url changes by environment
        RestRequest request = new RestRequest();
        request.httpMethod = 'GET';
        request.requestURI = endpoint;

        //Prepare RestContext
        RestContext.request = request;
        
        Test.startTest();
        Account receivedAcc = AccountManager.getAccount(); //gets the complete account detail

        //Perform assertions
        Assert.areEqual(acc.Id, receivedAcc.Id);
        Assert.areEqual(acc.AnnualRevenue, receivedAcc.AnnualRevenue);
        Test.stopTest();
    }

    @isTest
    private static void deleteAccountTest(){
        //Prepare RestRequest
        Account acc = TestSuite.createAccount(); //creating a new record, coz we dont want to delete the record created in TestSetup
        String endpoint = URL.getOrgDomainURL().toExternalForm() + '/services/apexrest/Account/' + acc.Id; //domain url changes by environment
        RestRequest request = new RestRequest();
        request.httpMethod = 'DELETE';
        request.requestURI = endpoint;

        //Prepare RestContext
        RestContext.request = request;
        
        Test.startTest();
        String result = AccountManager.deleteAccount(); //deletes the account record created here

        //Perform assertions
        Assert.areEqual('Success! Record has been deleted!', result);
        Test.stopTest();
    }

    @isTest
    private static void putAccountTest(){
        //Prepare RestRequest
        String jsonString = '{"Name":"Test Account","Type":"New Customer","Industry":"Energy","Rating":"Cold","AnnualRevenue":5000000}'; //prepared a json string, it can be used for preparing rest request
        RestRequest request = new RestRequest();
        request.httpMethod = 'PUT';
        request.requestBody = Blob.valueOf(jsonString); //Convert the json string into Blob as the data type of requestBody is Blob

        //Prepare RestContext
        RestContext.request = request;

        Test.startTest();
        Account acc = AccountManager.putAccount(); //It creates an account using the json string that we placed in the RestRequest

        //Perform assertions
        Assert.areEqual(5000000, acc.AnnualRevenue);
        Assert.areEqual('Cold', acc.Rating);
        Test.stopTest();
    }

    @isTest
    private static void patchAccountTest(){
        //Prepare RestRequest
        Account accObj = [SELECT Id, AnnualRevenue FROM Account LIMIT 1];
        String jsonString = '{"Id":"' + accObj.Id + '", "AnnualRevenue":6000000}'; //prepared a json string, it can be used for preparing rest request
        RestRequest request = new RestRequest();
        request.httpMethod = 'PATCH';
        request.requestBody = Blob.valueOf(jsonString); //Convert the json string into Blob as the data type of requestBody is Blob

        //Prepare RestContext
        RestContext.request = request;

        Test.startTest();
        Account acc = AccountManager.patchAccount(); //It creates an account using the json string that we placed in the RestRequest

        //Perform assertions
        Assert.areEqual(6000000, acc.AnnualRevenue);
        Test.stopTest();
    }
}