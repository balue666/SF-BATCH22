public with sharing class CaseInvocable {
    //1. Annotate the apex method with @InvocableMethod
    //2. Method should be public/global static
    //3. Only 1 input is allowed, make sure you bulkify it
    //4. Only 1 Invocable method per class is allowed, no other annotations are allowed too
    //5. If you want to receive more than 1 inputfrom the flow, write a wrapper and annotate each variable with @InvocableVariable 

    @InvocableMethod(label='Send Email & Save as Activity'
    description='Sends an email and saves the same under activity'
    category='Case')
    public static void sendEmailMessage(List<CaseRequest> requests){
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
        for(CaseRequest request : requests){
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setSubject(request.caseNumber + ': ' + request.subject);
            message.setPlainTextBody('Hello there, \n A case has been created for your query. Stay tuned for further updates. \n Thanks, \n Salesforce');
            message.setTargetObjectId(request.contactId);
            message.setSaveAsActivity(true);
            messages.add(message);
        }
        try {
            Messaging.sendEmail(messages);
        } catch(Exception ex){
            System.debug(ex.getMessage());
        }
    }

    public class CaseRequest {
        @InvocableVariable(label='Case Number' description='Case Number' required=true)
        public String caseNumber;

        @InvocableVariable(label='Contact ID' description='Contact ID' required=true)
        public String contactId;

        @InvocableVariable(label='Case Subject' description='Case Subject' required=true)
        public String subject;
    }
}
