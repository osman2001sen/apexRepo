/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-08-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountHandlerTest {   
    
    @isTest
    public static void addStudenttoCohort1(){
        // Prepare Data
        
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            singleContact.LastName='STUDENT '+num;
            
			multiContact.add(singleContact);            
        }
        
        AccountHandler.addStudenttoCohort('TEST COHORT',multiContact);
        
        
        // Test and Evaluate
         
        List<Contact> actual = [SELECT Id, Name, accountid, Account.Name FROM Contact];
        
        System.assertEquals(200, actual.size());
	}
}