/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class PopulateContactMailingAddress implements Database.Batchable<sObject>, Database.Stateful{
	
    public Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, BillingStreet, BillingCity, BillingState, BillingCountry, BillingPostalCode,' + 
                                       	'(SELECT Id, MailingStreet, MailingCity, MailingState, MailingCountry, MailingPostalCode FROM Contacts)' +
                                        'FROM Account WHERE BillingCountry = \'USA\'');
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accList){
        List<Contact> contList = new List<Contact>();
        
        for(Account acc:accList){
            for(Contact cont:acc.Contacts){
                cont.MailingStreet=acc.BillingStreet;
                cont.MailingCity=acc.BillingCity;
                cont.MailingState=acc.BillingState;
                cont.MailingPostalCode=acc.BillingPostalCode;
                cont.MailingCountry=acc.BillingCountry;
                contList.add(cont);
                recordCount++;
            }
        }
        
        update contList;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Record Count = ' + recordCount);
    }
}