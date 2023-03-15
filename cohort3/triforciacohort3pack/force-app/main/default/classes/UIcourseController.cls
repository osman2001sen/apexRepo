/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class UIcourseController {
    public UIcourseController() {

    }


    @AuraEnabled(cacheable=true)
    public static List<Course__c> retrieve(){

        List<Course__c> multiCourse=New List<Course__c>();
        try {
            multiCourse=[SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c 
            FROM Course__c
            WHERE Start__c>TODAY];
        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return multiCourse;
    }
}