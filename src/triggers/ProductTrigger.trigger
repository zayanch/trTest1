trigger ProductTrigger on Product__c (before insert, before update) {
    if(Trigger.isBefore & Trigger.isInsert){        
        ProductTriggerHelper.triggerHelperBeforeInsert(Trigger.new);
        
    }else if(Trigger.isBefore & Trigger.isUpdate){
        ProductTriggerHelper.triggerHelperBeforeUpdate(Trigger.new);
    }
}