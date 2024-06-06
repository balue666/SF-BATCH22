public with sharing class ProductCtrl {
    
    //Find all the products whose name / brand / category contains the given search key
    @AuraEnabled
    public static List<Product__c> findProducts(String searchKey){
        searchKey = '%' + searchKey + '%';
        return [SELECT Id, Name, Brand__c, Category__c, Description__c, Price__c, Rating__c, Stock__c
        FROM Product__c
        WHERE Name LIKE :searchKey
        OR Brand__c LIKE :searchKey
        OR Category__c LIKE :searchKey
        WITH SECURITY_ENFORCED];
    }
}