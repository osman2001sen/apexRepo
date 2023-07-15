public class CampaignHandler {
    
    public static void updateCampaignStatus(List<Campaign> campaignsToUpdate) {
        List<Campaign> campaignsToUpdateWithStatus = new List<Campaign>();
        
        for (Campaign campaign : campaignsToUpdate) {
            if (campaign.Status != 'Completed') {
                campaign.Status = 'Completed';
                campaignsToUpdateWithStatus.add(campaign);
            }
        }
        
        if (!campaignsToUpdateWithStatus.isEmpty()) {
            update campaignsToUpdateWithStatus;
        }
    }
    
    public static void calculateCampaignROI(List<Campaign> campaignsToUpdate) {
        for (Campaign campaign : campaignsToUpdate) {
            if (campaign.ActualCost != null && campaign.NumberOfLeads != null && campaign.NumberOfOpportunities != null) {
                if (campaign.NumberOfLeads > 0) {
                    campaign.ReturnOnInvestment__c = (campaign.NumberOfOpportunities * 100) / campaign.NumberOfLeads;
                } else {
                    campaign.ReturnOnInvestment__c = 0;
                }
            }
        }
        
        if (!campaignsToUpdate.isEmpty()) {
            update campaignsToUpdate;
        }
    }
}
