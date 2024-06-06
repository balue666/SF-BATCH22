trigger ProductTrigger on Product__c (after update) {
    //Check if the trigger is active
    Trigger_Controls__mdt controls = Trigger_Controls__mdt.getInstance('Product');
    if(controls.IsActive__c){
        if(Trigger.isAfter){
            if(Trigger.isUpdate){
                ProductHandler.afterUpdate(Trigger.old, Trigger.new);
            }
        }
    }
}