/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-14-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class accountLWCController {
    
    
    // constructor
    public accountLWCController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> retrive(String searchterm){

        List<Account> multiAcc = New List<Account>();

        String search='%' + searchterm + '%';


        try {
            multiAcc = [SELECT Id, Name, Industry, Website, Phone 
                        FROM Account
                        WHERE Name LIKE :search 
                        ORDER BY CreatedDate DESC];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return multiAcc;
    }

}