trigger LeadTrigger on Lead (before insert) {      
	
    for(Lead singleLead:Trigger.New){            
        
        singleLead.FirstName=singleLead.FirstName.toUpperCase();
        singleLead.LastName=singleLead.LastName.toUpperCase();
        singleLead.Company=singleLead.Company.toUpperCase();
        
    }											
    
}