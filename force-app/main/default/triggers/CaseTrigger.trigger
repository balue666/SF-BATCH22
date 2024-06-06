trigger CaseTrigger on Case (after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            CaseHandler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
    }
}