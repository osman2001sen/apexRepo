/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-22-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class UpdateContactEmailBatch implements Database.Batchable<sObject> {
    global final String newEmail;
    global final String conditionField;
    global final String conditionValue;
    
    global UpdateContactEmailBatch(String newEmail, String conditionField, String conditionValue) {
        this.newEmail = newEmail;
        this.conditionField = conditionField;
        this.conditionValue = conditionValue;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Email FROM Contact WHERE ' + conditionField + ' = \'' + conditionValue + '\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> scope) {
        List<Contact> contactsToUpdate = new List<Contact>();
        
        for (Contact con : scope) {
            con.Email = newEmail;
            contactsToUpdate.add(con);
        }
        
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
    }
    
    global void finish(Database.BatchableContext BC) {
    }
}
