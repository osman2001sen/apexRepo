@isTest
public class GuestUserControllerTest {
    
    @isTest
    static void testCreateLead() {
        Lead lead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Email = 'test@test.com',
            Phone = '555-555-5555'
        );
        String infoDate = '2023-03-01T20:26:00.000Z';
        
        Test.startTest();
        String leadId = GuestUserController.createLead(lead, infoDate);
        Test.stopTest();
        
        Lead insertedLead = [SELECT Id, FirstName, LastName, Company, Email, Phone, Info_Session_Date_Time__c FROM Lead WHERE Id = :leadId];
        
        System.assertEquals('Test', insertedLead.FirstName);
        System.assertEquals('Lead', insertedLead.LastName);
        System.assertEquals('Test Company', insertedLead.Company);
        System.assertEquals('test@test.com', insertedLead.Email);
        System.assertEquals('555-555-5555', insertedLead.Phone);
        System.assertEquals(DateTime.valueOf('2023-03-01 20:26:00'), insertedLead.Info_Session_Date_Time__c);
    }
    
    @isTest
    static void testRetrieveCampaign() {
        Campaign campaign = new Campaign(
            Name = 'Test Campaign'
        );
        insert campaign;
        
        Test.startTest();
        Campaign retrievedCampaign = GuestUserController.retrieveCampaign('Test');
        Test.stopTest();
        
        System.assertEquals('Test Campaign', retrievedCampaign.Name);
    }
    
    
    
    @isTest
    static void testCreateCampaignMember() {
        Campaign campaign = new Campaign(
            Name = 'Test Campaign'
        );
        insert campaign;
        
        Lead lead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Email = 'test@test.com',
            Phone = '555-555-5555'
        );
        insert lead;
        
        CampaignMember cm = new CampaignMember(
            CampaignId = campaign.Id,
            LeadId = lead.Id
        );
        
        Test.startTest();
        String cmId = GuestUserController.createCampaignMember(cm);
        Test.stopTest();
        
        CampaignMember insertedCm = [SELECT Id, CampaignId, LeadId FROM CampaignMember WHERE Id = :cmId];
        
        System.assertEquals(campaign.Id, insertedCm.CampaignId);
        System.assertEquals(lead.Id, insertedCm.LeadId);
    }
    
    @isTest
    static void testCreateAd() {
        Campaign campaign = new Campaign(
            Name = 'Test Campaign'
        );
        insert campaign;
        
        Ad__c ad = new Ad__c(
            UTM_Campaign__c = 'Test UTM Campaign',
            UTM_Content__c = 'Test UTM Content',
            UTM_Referer__c = 'Test UTM Referer',
            UTM_Medium__c = 'Test UTM Medium',
            UTM_Source__c = 'Test UTM Source',
            UTM_Term__c = 'Test UTM Term',
            Campaign__c = campaign.Id
        );
        
        Test.startTest();
        String adId = GuestUserController.createAd(ad);
        Test.stopTest();
        
        Ad__c insertedAd = [SELECT Id, UTM_Campaign__c, UTM_Content__c, UTM_Referer__c, UTM_Medium__c, UTM_Source__c, UTM_Term__c, Campaign__c FROM Ad__c WHERE Id = :adId];
        
        System.assertEquals('Test UTM Campaign', insertedAd.UTM_Campaign__c);
        System.assertEquals('Test UTM Content', insertedAd.UTM_Content__c);
        System.assertEquals('Test UTM Referer', insertedAd.UTM_Referer__c);
        System.assertEquals('Test UTM Medium', insertedAd.UTM_Medium__c);
        System.assertEquals('Test UTM Source', insertedAd.UTM_Source__c);
        System.assertEquals('Test UTM Term', insertedAd.UTM_Term__c);
        System.assertEquals(campaign.Id, insertedAd.Campaign__c);
    }
    
    @isTest
static void testRetrieveCourse() {
    Course__c course1 = new Course__c(
        Name = 'Test Course 1',
        Start__c = Date.today().addDays(1),
        End__c = Date.today().addDays(8)
    );
    insert course1;
    
    Course__c course2 = new Course__c(
        Name = 'Test Course 2',
        Start__c = Date.today().addDays(2),
        End__c = Date.today().addDays(9)
    );
    insert course2;
    
    Test.startTest();
    List<Course__c> courses = GuestUserController.retrieveCourse();
    Test.stopTest();
    
    System.assertEquals(2, courses.size());
    System.assertEquals('Test Course 1', courses[0].Name);
    System.assertEquals(Date.today().addDays(1), courses[0].Start__c);
    System.assertEquals(Date.today().addDays(8), courses[0].End__c);
    System.assertEquals('Test Course 2', courses[1].Name);
    System.assertEquals(Date.today().addDays(2), courses[1].Start__c);
    System.assertEquals(Date.today().addDays(9), courses[1].End__c);
}
    
 @isTest
static void testCreateLeadNegative() {
    Lead lead = new Lead(
        FirstName = 'Test',
        LastName = '', // empty Last Name field
        Company = 'Test Company',
        Email = 'test@test.com',
        Phone = '555-555-5555'
    );
    String infoDate = '2023-03-01T20:26:00.000Z';
    
    Test.startTest();
    AuraHandledException auraException = null;
    try {
        GuestUserController.createLead(lead, infoDate);
    } catch (AuraHandledException e) {
        auraException = e;
    }
    Test.stopTest();
    
    System.assertNotEquals(null, auraException);
    System.assertEquals('Script-thrown exception', auraException.getMessage());
}
    
    
    @isTest
    static void testCreateAdWithCampaign() {
        // Create a test campaign
        Campaign testCampaign = new Campaign(Name = 'Google 11111');
        insert testCampaign;

        // Create a test Ad record
        Ad__c testAd = new Ad__c(
            UTM_Campaign__c = 'Google 11111',
            UTM_Content__c = 'Test Content',
            UTM_Referer__c = 'Test Referer',
            UTM_Medium__c = 'Test Medium',
            UTM_Source__c = 'Test Source',
            UTM_Term__c = 'Test Term',
            Campaign__c = testCampaign.Id
        );
        
        // Insert the Ad record
        Test.startTest();
        String adId = GuestUserController.createAd(testAd);
        Test.stopTest();

        // Retrieve the inserted Ad record
        Ad__c insertedAd = [SELECT Id, UTM_Campaign__c, UTM_Content__c, UTM_Referer__c, UTM_Medium__c, UTM_Source__c, UTM_Term__c, Campaign__c FROM Ad__c WHERE Id = :adId];
        
        // Verify that the Campaign__c field is the same as the Campaign record Id
        System.assertEquals(testCampaign.Id, insertedAd.Campaign__c);
    }
      @isTest
    static void testCreateCampaignMemberWithEmptyRequiredFields() {
        // Create a new CampaignMember object with empty required fields
        CampaignMember cm = new CampaignMember();

        // Verify that an exception is thrown when trying to insert the CampaignMember object
        Test.startTest();
        String campmemberId ;
        String errmsg;
        try{
            campmemberId = GuestUserController.createCampaignMember(cm);
        } catch(Exception e){
            System.debug('Error : '+ e.getMessage());
            errmsg=e.getMessage();
        } 
       
        Test.stopTest();
        
        
        Assert.areEqual(null, campmemberId);
        Assert.areEqual('Script-thrown exception', errmsg);
        
    }
    
}