@isTest
public with sharing class OpportunityManagerTest {

    @TestSetup
    private static void makeData(){
        //Create account
        Account acc = TestSuite.createAccount();

        //Create opps
        List<Opportunity> opps = TestSuite.createOpps(acc.Id, 3);

        Test.startTest();
        //create user
        Test.stopTest();
    }

    @isTest
    private static void getAccountOppsTest(){
        //Prepare RestRequest
        Account acc = [SELECT Id, AnnualRevenue FROM Account LIMIT 1];
        String endpoint = URL.getOrgDomainUrl().toExternalForm() + '/services/apexrest/Opps/' + acc.Id; //endpoint to hit web service
        RestRequest request = new RestRequest();
        request.httpMethod = 'GET';
        request.requestURI = endpoint;

        //Prepare RestContext
        RestContext.request = request;

        Test.startTest();
        Account receivedAcc = OpportunityManager.getAccountOpps(); //1 Account + 3 Opps

        //Perform assertions
        Assert.areEqual(2000000, receivedAcc.AnnualRevenue);
        Assert.areEqual(3, receivedAcc.Opportunities.size()); //we should receive 3 opps as we have created in the testsetup
        for(Integer i=1; i<=receivedAcc.Opportunities.size(); i++){
            Assert.areEqual(2000000*i, receivedAcc.Opportunities[i-1].Amount);
        }
        Test.stopTest();

    }
}



TestClass {

    @TestSetup
    static void makeData(){
        //Create Account
        //Create Contact

        Test.startTest();
        //price book
        //pricebook entry
        Test.stopTest();
    }

    @isTest
    private static void getAccountOppsTest(){
        //opp
        //opp line item
        Test.startTest();
        //real testing
        Test.stopTest();

        //Approach 1
        List<Contact> contacts = [SELECT Id, Name, Title, Deprtament, Email FROM Contact WHERE Email != NULL]; //40,000
        for(Contact con : contacts){

        }

        //Approach 2
        for(Contact con : [SELECT Id, Name, Title, Deprtament, Email FROM Contact WHERE Email != NULL]){

        }
    }
}