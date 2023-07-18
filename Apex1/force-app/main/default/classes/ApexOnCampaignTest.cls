/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-17-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class CampaignHandlerTest {
    @isTest
    static void testUpdateCampaignStatus() {
        // Create test data
        List<Campaign> campaignsToUpdate = new List<Campaign>();
        Campaign campaign1 = new Campaign(Status = 'In Progress');
        Campaign campaign2 = new Campaign(Status = 'Completed');
        campaignsToUpdate.add(campaign1);
        campaignsToUpdate.add(campaign2);
        
        // Call the method to be tested
        Test.startTest();
        CampaignHandler.updateCampaignStatus(campaignsToUpdate);
        Test.stopTest();
        
        // Verify the results
        List<Campaign> updatedCampaigns = [SELECT Id, Status FROM Campaign WHERE Id IN :campaignsToUpdate];
        System.assertEquals(1, updatedCampaigns.size(), 'Only one campaign should be updated');
        System.assertEquals('Completed', updatedCampaigns[0].Status, 'Campaign status should be updated to Completed');
    }
    
    @isTest
    static void testCalculateCampaignROI() {
        // Create test data
        List<Campaign> campaignsToUpdate = new List<Campaign>();
        Campaign campaign1 = new Campaign(ActualCost = 100, NumberOfLeads = 50, NumberOfOpportunities = 10);
        Campaign campaign2 = new Campaign(ActualCost = 200, NumberOfLeads = 0, NumberOfOpportunities = 20);
        Campaign campaign3 = new Campaign(ActualCost = 300, NumberOfLeads = null, NumberOfOpportunities = 30);
        campaignsToUpdate.add(campaign1);
        campaignsToUpdate.add(campaign2);
        campaignsToUpdate.add(campaign3);
        
        // Call the method to be tested
        Test.startTest();
        CampaignHandler.calculateCampaignROI(campaignsToUpdate);
        Test.stopTest();
        
        // Verify the results
        List<Campaign> updatedCampaigns = [SELECT Id, ReturnOnInvestment__c FROM Campaign WHERE Id IN :campaignsToUpdate];
        System.assertEquals(1, updatedCampaigns.size(), 'Only one campaign should have ROI updated');
        System.assertEquals(20, updatedCampaigns[0].ReturnOnInvestment__c, 'Campaign ROI should be calculated correctly');
        System.assertEquals(0, updatedCampaigns[1].ReturnOnInvestment__c, 'Campaign ROI should be 0 when NumberOfLeads is 0');
        System.assertNull(updatedCampaigns[2].ReturnOnInvestment__c, 'Campaign ROI should be null when NumberOfLeads is null');
    }
}