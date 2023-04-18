/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-18-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactTrigger on Contact (before insert){

    Set<Id> accountIds = New Set<Id>();
    
    for(Contact singleContact:Trigger.New){
        
        if(String.isBlank(singleContact.phone)){
            accountIds.add(singleContact.accountId);
        }
    }
    
    Map <Id, Account> MapAcc = New Map<Id, Account>([SELECT Id, Name, Phone FROM Account WHERE Id=:accountIds]);
    
    for(Contact singleContact:Trigger.New){
        
        if(String.isBlank(singleContact.phone)){
            
            singleContact.OtherPhone = MapAcc.get(singleContact.AccountId).phone;
        }
    }
}