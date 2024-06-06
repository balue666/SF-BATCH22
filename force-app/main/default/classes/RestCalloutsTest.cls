@isTest
public with sharing class RestCalloutsTest {
    
    @isTest
    public static void getAnimalsTest(){
        Test.startTest();
        //1. Set Mock: What this set mock does?
        //Instead of making a real web service callout, this will route the prepared request to respond method written in RestCalloutsMock class
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make the callout - This response was produced by respond method
        HttpResponse response = RestCallouts.getAnimals();

        //3. Perform asserts
        Assert.areEqual(200, response.getStatusCode());
        Assert.areEqual('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    public static void getProductTest(){
        Test.startTest();
        //1. Set Mock: What this set mock does?
        //Instead of making a real web service callout, this will route the prepared request to respond method written in RestCalloutsMock class
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make the callout - This response was produced by respond method
        HttpResponse response = RestCallouts.getProduct();

        //3. Perform asserts
        Assert.areEqual(200, response.getStatusCode());
        Assert.areEqual('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    public static void getRecipeTest(){
        Test.startTest();
        //1. Set Mock: What this set mock does?
        //Instead of making a real web service callout, this will route the prepared request to respond method written in RestCalloutsMock class
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make the callout - This response was produced by respond method
        HttpResponse response = RestCallouts.getRecipe(1);

        //3. Perform asserts
        Assert.areEqual(200, response.getStatusCode());
        Assert.areEqual('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    public static void postCommentTest(){
        Test.startTest();
        //1. Set Mock: What this set mock does?
        //Instead of making a real web service callout, this will route the prepared request to respond method written in RestCalloutsMock class
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make the callout - This response was produced by respond method
        Comment__c com = new Comment__c();
        com.Name = 'Test Comment';
        com.Post_ID__c = 20;
        com.Email__c = 'test@test.com';
        com.Body__c = 'Test Body';
        insert com;
        HttpResponse response = RestCallouts.postComment(com.Id);

        //3. Perform asserts
        Assert.areEqual(200, response.getStatusCode());
        Assert.areEqual('OK', response.getStatus());
        Test.stopTest();
    }
}