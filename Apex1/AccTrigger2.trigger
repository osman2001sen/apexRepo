/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before insert, after insert) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.changeRating(Trigger.New);
        }else if(Trigger.isAfter){
            AccountTriggerHandler.createRelatedOpportunity(Trigger.New);
        }
    }
}