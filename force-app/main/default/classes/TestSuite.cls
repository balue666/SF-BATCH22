@isTest
public with sharing class TestSuite {
    
    public static Account createAccount(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Type = 'New Customer';
        acc.Industry = 'Energy';
        acc.AnnualRevenue = 2000000;
        acc.Rating = 'Warm';
        insert acc;
        return acc;
    }

    public static List<Opportunity> createOpps(Id accId, Integer count){
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer i=1; i<=count; i++){
            Opportunity opp = new Opportunity();
            opp.AccountId = accId;
            opp.Name = 'Test Opp ' + i;
            opp.Amount = 2000000 * i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today();
            opps.add(opp);
        }
        insert opps;
        return opps;
    }
}