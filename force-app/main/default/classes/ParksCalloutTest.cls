@isTest
public with sharing class ParksCalloutTest {
    @isTest
    private static void getParksTest(){
        Test.startTest();
        ParksCalloutMock mock = new ParksCalloutMock();
        Test.setMock(WebServiceMock.class, mock); //All callouts made after this would be routed to ParksCalloutMock class - doInvoke method

        String[] parks = ParksCallout.getParks('United States'); //Real callout will not happen, instead it calls doInvoke from ParksCalloutMock

        Assert.areEqual(3, parks.size()); //You do get 3 parks from the fake response
        Test.stopTest();
    }
}