public with sharing class RecipeCtrl {
    //Get distinct cuisine types
    @AuraEnabled(cacheable=true)
    public static List<String> getCusineTypes(){
        Set<String> cuisineTypes = new Set<String>();
        List<String> cuisineTypeList = new List<String>();
        for(Recipe__c recipe : [SELECT Cuisine_Type__c FROM Recipe__c WHERE Cuisine_Type__c != NULL]){
            cuisineTypes.add(recipe.Cuisine_Type__c);
        }
        cuisineTypeList.addAll(cuisineTypes);
        return cuisineTypeList;
    }

    //Get all the recipes having the given cuisine type
    @AuraEnabled
    public static List<Recipe__c> getRecipes(String cuisineType){
        return [SELECT Id, Name, Cuisine_Type__c, Ingredients__c, Instructions__c, Thumbnail__c, Calories_Per_Serving__c, Rating__c
        FROM Recipe__c
        WHERE Cuisine_Type__c = :cuisineType
        WITH SECURITY_ENFORCED];
    }
}