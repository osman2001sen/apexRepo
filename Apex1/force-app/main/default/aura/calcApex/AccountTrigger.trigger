/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-01-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before insert, before update) {
    
    for(Account a:trigger.new){
        if(trigger.isInsert && trigger.isBefore){
            a.Type='Prospect';
        }
        
        if(trigger.isBefore && trigger.isUpdate){
            a.Description='This Account is updated by ' + UserInfo.getName();
        }
    }
}