/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ConvertLead on Lead (after update) {
    List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
    for (Lead lead : Trigger.new) {
        if (lead.IsConverted && !Trigger.oldMap.get(lead.Id).IsConverted) {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(lead.Id);
            lc.setConvertedStatus('Qualified');
            leadConverts.add(lc);
        }
    }
    if (leadConverts.size() > 0) {
        List<Database.LeadConvertResult> convertResults = Database.convertLead(leadConverts);
    }
}
