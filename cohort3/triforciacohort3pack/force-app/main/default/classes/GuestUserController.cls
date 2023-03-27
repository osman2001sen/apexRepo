/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class GuestUserController {

    @AuraEnabled
    public static string createLead(Lead singleLead, String infoDate){
        // 2023-03-01T20:26:00.000Z
        // yyyy-MM-dd HH:mm:ss

        Datetime info = Datetime.valueOf(infoDate.replace('T',' '));

        singleLead.OSNS1__Info_Session_Date_Time__c=info;

        try {
            insert singleLead;
        } catch (Exception e) {
           
            throw new AuraHandledException(e.getMessage());
        }

        return singleLead.Id;
    }


    @AuraEnabled(cacheable=true)
    public static Campaign retrieveCampaign(String searchCampaign){
        String search='%'+searchCampaign+'%';
        Campaign singleCampaign = New Campaign();
        try {
            singleCampaign=[SELECT Id,Name FROM Campaign WHERE Name LIKE :search LIMIT 1];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return singleCampaign;
    }


    @AuraEnabled
    public static string createAd(OSNS1__Ad__c singleAd){
        try {
            insert singleAd;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return singleAd.id;
    }


    @AuraEnabled
    public static string createCampaignMember(CampaignMember cm){
        try {
            insert cm;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return cm.id;
    }
    


    @AuraEnabled(cacheable=true)
    public static List<OSNS1__Course__c> retrieveCourse(){

        List<OSNS1__Course__c> multiCourse=New List<OSNS1__Course__c>();
        try {
            // SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c FROM Course__c

            multiCourse=[SELECT Id, Name, OSNS1__Cohort__c, OSNS1__End__c, OSNS1__Interview__c, OSNS1__Module__c, OSNS1__Start__c FROM OSNS1__Course__c
            WHERE OSNS1__Start__c>TODAY];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return multiCourse;
    }
}