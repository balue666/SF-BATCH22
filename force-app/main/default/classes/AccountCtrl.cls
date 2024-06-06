public with sharing class AccountCtrl {
    //Get top 5 accounts based on their annual revenue
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccounts(){
        List<Account> accounts = [SELECT Id, Name, Type, Industry, Rating, AnnualRevenue
            FROM Account
            WHERE AnnualRevenue != NULL
            WITH SECURITY_ENFORCED
            ORDER BY AnnualRevenue DESC
            LIMIT 5];
        return accounts;
    }
}