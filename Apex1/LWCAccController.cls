/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-25-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class accountLWCController {
    
    
    // constructor
    public accountLWCController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> retrive(){

        List<Account> multiAcc = New List<Account>();


        try {
            multiAcc = [SELECT Id, Name, Industry, Website, Phone 
                        FROM Account 
                        ORDER BY CreatedDate DESC                        
                        LIMIT 10];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return multiAcc;
    }

}