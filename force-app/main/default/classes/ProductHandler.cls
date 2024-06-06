public with sharing class ProductHandler {
    public static void afterUpdate(List<Product__c> oldProds, List<Product__c> newProds){
        for(Product__c prod : newProds){
            RestCallouts.updateProduct(prod.Id);
        }
    }
}