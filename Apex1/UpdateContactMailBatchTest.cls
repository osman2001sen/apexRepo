/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class PopulateContactMailingAddressTest {
	
    @isTest
    public static void testAddressTransfer(){
        List<Account> accList = new List<Account>();
        List<Contact> contList = new List<Contact>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account (Name='TestAcc'+i, BillingCity='Los Angeles', BillingCountry='USA');
            accList.add(acc);
        }
        
        insert accList;
        
        for(Account singleacc:accList){
            Contact cont = new Contact();
            cont.LastName = 'TestLName';
            cont.AccountId = singleacc.Id;
            contList.add(cont);
        }
        
        insert contList;
        
        Test.startTest();
        PopulateContactMailingAddress accprocess = new PopulateContactMailingAddress();
        Id batchId = Database.executeBatch(accprocess);
        Test.stopTest();
        
        Integer countedContact = [SELECT count() FROM Contact WHERE MailingCity='Los Angeles'];
        System.assertEquals(200, countedContact);
    }
}