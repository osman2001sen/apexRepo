/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger LeadConversionTrigger on Lead (after update) {
    List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
    
    for (Lead lead : Trigger.new) {
        if (lead.IsConverted == false && lead.ConvertedAccountId == null) {
            Database.LeadConvert leadConvert = new Database.LeadConvert();
            leadConvert.setLeadId(lead.Id);
            
            
            leadConvert.setConvertedStatus('Qualified');
            
            leadConvert.setContactId(lead.ConvertedContactId);
            leadConvert.setContactFirstName(lead.FirstName);
            leadConvert.setContactLastName(lead.LastName);
            leadConvert.setContactEmail(lead.Email);
            
            
            leadConvert.setAccountId(lead.ConvertedAccountId);
            leadConvert.setAccountName(lead.Company);
            
            
            leadConvert.setOpportunityName('New Opportunity');
            leadConvert.setOpportunityStage('Prospecting');
            leadConvert.setOpportunityCloseDate(Date.today().addDays(30));
            
            leadConverts.add(leadConvert);
        }
    }
    
    if (!leadConverts.isEmpty()) {
        List<Database.LeadConvertResult> convertResults = Database.convertLead(leadConverts);
        
        List<Lead> updatedLeads = new List<Lead>();
        
        for (Database.LeadConvertResult convertResult : convertResults) {
            if (convertResult.isSuccess()) {
                Lead convertedLead = new Lead(
                    Id = convertResult.getLeadId(),
                    IsConverted = true,
                    ConvertedDate = System.now(),
                    ConvertedAccountId = convertResult.getAccountId(),
                    ConvertedContactId = convertResult.getContactId(),
                    ConvertedOpportunityId = convertResult.getOpportunityId()
                );
                updatedLeads.add(convertedLead);
            }
        }
        
        if (!updatedLeads.isEmpty()) {
            update updatedLeads;
        }
    }
}
