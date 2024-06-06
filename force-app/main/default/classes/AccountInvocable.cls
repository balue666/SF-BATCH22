public with sharing class AccountInvocable {
    //1. Annotate the apex method with @InvocableMethod
    //2. Method should be public/global static
    //3. Only 1 input is allowed, make sure you bulkify it
    //4. Only 1 Invocable method per class is allowed, no other annotations are allowed too

    @InvocableMethod(label='Close Opportunities'
    description='It closes all the opportunities available under the given deactivated accounts'
    category='Opportunity')
    public static void closeOpportunities(List<Id> accountIds){
        List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity 
            WHERE StageName NOT IN ('Closed Won', 'Closed Lost')
            AND AccountId IN :accountIds];
        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                opp.StageName = 'Closed Lost';
            }
            try {
                update opps;
            } catch(Exception ex){
                System.debug(ex.getMessage());
            }
        }
    }

}
