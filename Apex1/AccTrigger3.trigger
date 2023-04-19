/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-19-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before insert, after insert, before update) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.changeRating(Trigger.New);
        }else if(Trigger.isAfter){
            AccountTriggerHandler.createRelatedOpportunity(Trigger.New);
        }
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateAccountDesc(Trigger.New, Trigger.oldMap);
        }
    }
}