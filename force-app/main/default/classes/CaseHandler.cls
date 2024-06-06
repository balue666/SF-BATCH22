public with sharing class CaseHandler {
    public static void afterUpdate(Map<Id,Case> oldCases, Map<Id,Case> newCases){
        List<Case_Closure__e> closures = new List<Case_Closure__e>();
        for(Id caseId : newCases.keySet()){
            Case oldCase = oldCases.get(caseId);
            Case newCase = newCases.get(caseId);
            if(oldCase.Status != newCase.Status && newCase.Status == 'Closed'){
                Case_Closure__e closure = new Case_Closure__e();
                closure.Case_Number__c = newCase.CaseNumber;
                closure.Case_Subject__c = newCase.Subject;
                closure.Description__c = newCase.Description;
                closure.Email__c = newCase.ContactEmail;
                closures.add(closure);                
            }
        }
        if(!closures.isEmpty()){
            EventBus.publish(closures);
        }
    }
}
