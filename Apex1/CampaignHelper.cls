/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-18-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CampaignHelper {
    public static void updateCampaignStatus(List<Campaign> campaigns) {
        List<Campaign> campaignsToUpdate = new List<Campaign>();
        
        for (Campaign campaign : campaigns) {
            // Check if the campaign is active and the end date has passed
            if (campaign.IsActive && campaign.EndDate < Date.today()) {
                campaign.Status = 'Completed';
                campaignsToUpdate.add(campaign);
            }
        }
        
        if (!campaignsToUpdate.isEmpty()) {
            update campaignsToUpdate;
        }
    }
}
