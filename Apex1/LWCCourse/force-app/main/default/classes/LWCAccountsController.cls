/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class LWCAccountsController {
    
    @AuraEnabled
    public static List<Account> getAccounts(String searchText){
        try {
            if(String.isEmpty(searchText)){
                return [SELECT Id, Name FROM Account];
            }
            else{
                searchText='%'+searchText+'%';
                return [SELECT Id, Name FROM Account WHERE Name LIKE :searchText];
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Contact> getAccountContacts(String accountId){
        try {

            return [SELECT Id, Name FROM Contact WHERE accountId=:accountId];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
    