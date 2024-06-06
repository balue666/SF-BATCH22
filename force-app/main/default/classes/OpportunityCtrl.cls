public with sharing class OpportunityCtrl {
    //Get top opps in the given stage based on the amount
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getTopOpps(String stage){
        return [SELECT Id, Name, Type, StageName, Amount, CloseDate
        FROM Opportunity
        WHERE StageName = :stage
        AND Amount != NULL
        WITH SECURITY_ENFORCED
        ORDER BY Amount DESC];
    }
}