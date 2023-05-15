/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-14-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CampaignSharing {

    // method to retrieve all Campaign records
    public static List<Campaign> getAllCampaigns() {
        return [SELECT Id, Name, StartDate, EndDate, Status FROM Campaign];
    }
    
    // method to retrieve Campaign records for the current user
    public static List<Campaign> getUserCampaigns() {
        return [SELECT Id, Name, StartDate, EndDate, Status FROM Campaign WHERE OwnerId = :UserInfo.getUserId()];
    }
    
    // method to retrieve Campaign records for a specific user
    public static List<Campaign> getUserCampaignsById(Id userId) {
        return [SELECT Id, Name, StartDate, EndDate, Status FROM Campaign WHERE OwnerId = :userId];
    }
    
    // method to create a new Campaign record
    public static void createCampaign(String name, Date startDate, Date endDate, String status) {
        Campaign campaign = new Campaign();
        campaign.Name = name;
        campaign.StartDate = startDate;
        campaign.EndDate = endDate;
        campaign.Status = status;
        insert campaign;
    }
    
    // method to update an existing Campaign record
    public static void updateCampaign(Id campaignId, String name, Date startDate, Date endDate, String status) {
        Campaign campaign = new Campaign();
        campaign.Id = campaignId;
        campaign.Name = name;
        campaign.StartDate = startDate;
        campaign.EndDate = endDate;
        campaign.Status = status;
        update campaign;
    }
    
    // method to delete an existing Campaign record
    public static void deleteCampaign(Id campaignId) {
        Campaign campaign = new Campaign();
        campaign.Id = campaignId;
        delete campaign;
    }
    
    // method to retrieve the Campaign Owner's name
    public static String getCampaignOwnerName(Id ownerId) {
        User owner = [SELECT Id, Name FROM User WHERE Id = :ownerId];
        return owner.Name;
    }
    
}
