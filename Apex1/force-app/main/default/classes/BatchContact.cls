/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class UpdateContactEmailBatch implements Database.Batchable<sObject> {
    
    // Specify the new email address
    private String newEmailAddress = 'newemail@example.com';
    
    global Database.QueryLocator start(Database.BatchableContext context) {
        // Retrieve the contacts that need to be updated
        String query = 'SELECT Id, Email FROM Contact WHERE Email != null';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext context, List<Contact> scope) {
        // Update the email addresses of the contacts
        for (Contact contact : scope) {
            contact.Email = newEmailAddress;
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext context) {
        // Perform any post-processing tasks
    }
}
