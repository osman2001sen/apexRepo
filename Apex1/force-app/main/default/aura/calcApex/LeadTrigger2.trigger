/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-22-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger LeadTrigger on Lead (before insert) {      
	
    
    System.debug('....Lead Trigger is working....');
    System.debug(Trigger.New);
    
    for(Lead singleLead:Trigger.New){            
        
        System.debug('Before update: '+singleLead);
        singleLead.firstName=singleLead.firstName.toUpperCase();
        singleLead.LastName=singleLead.LastName.toUpperCase();
        singleLead.Company=singleLead.Company.toUpperCase();
        System.debug('After update: '+singleLead);
        
    }											
    
} 