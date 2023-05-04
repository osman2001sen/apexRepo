/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class UpdateAccountRevenue implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name, AnnualRevenue FROM Account';
        return Database.getQueryLocator(query);
    }
 
    global void execute(Database.BatchableContext bc, List<sObject> scope) {
        List<Account> accountsToUpdate = new List<Account>();
        
        for (sObject s : scope) {
            Account a = (Account)s;
            a.AnnualRevenue *= 1.1; // Increase annual revenue by 10%
            accountsToUpdate.add(a);
        }
        
        update accountsToUpdate;
    }
 
    global void finish(Database.BatchableContext bc) {
        // Do any post-processing here
    }
}
