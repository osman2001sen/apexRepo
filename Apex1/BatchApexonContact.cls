/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class BatchApexContactUpdate implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        String query = 'SELECT Id, FirstName, LastName FROM Contact';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext context, List<Contact> contacts) {
        for (Contact contact : contacts) {
            contact.LastName = 'Updated';
        }
        update contacts; 
    }
    
    public void finish(Database.BatchableContext context) {
    

        return Database.getQueryLocator(query);
    }
    
    
    public void execute(Database.BatchableContext context, List<Contact> contacts) {
        for (Contact contact : contacts) {
            contact.LastName = 'Updated';
        }
        update contacts; 
    }
    
    public void finish(Database.BatchableContext context) {
    }
}
