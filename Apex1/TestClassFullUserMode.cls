/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@isTest                                        
public class AccountHandlerTest {   
    
    @isTest
    public static void addStudenttoCohort_TEST1(){  // POSTIVE BEHAVIOR , SINGLE ACCOUNT, MULTI CONTACT
        // Prepare Data
        
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            singleContact.LastName='STUDENT '+num;
            
			multiContact.add(singleContact);            
        }
        
        Boolean result = AccountHandler.addStudenttoCohort('TEST COHORT',multiContact);
        
        
        // Test and Evaluate
         
        List<Contact> actual = [SELECT Id, Name, accountid, Account.Name FROM Contact];
        
        Account singleAcc = [SELECT id, Name FROM Account LIMIT 1];
        
        System.assertEquals(true, result);
        
        System.assertEquals(200, actual.size());  
        
        System.assertNotEquals(null, actual.get(0).accountid);  // TEST 1 STUDENT 1  
          
        System.assertEquals(singleAcc.id, actual.get(0).accountid); 
        
        System.assertEquals('TEST COHORT', singleAcc.Name);
        
        
    }
    
    
    
    @isTest
    public static void addStudenttoCohort_TEST2(){  // NEGATIVE BEHAVIOUR
        
           // Prepare Data
        
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            // singleContact.LastName='STUDENT '+num;
            
			multiContact.add(singleContact);            
        }
        
        Boolean result=AccountHandler.addStudenttoCohort('TEST COHORT',multiContact);
        
        
        // Test and Evaluate
         
        List<Contact> testcontact = [SELECT Id, Name, accountid, Account.Name FROM Contact];
        
        List<Account> testAcc = [SELECT id, Name FROM Account LIMIT 1];
        
        System.debug(testAcc);
        System.debug(testcontact);
        
        System.assertEquals(false, result); // contact there is no last name ( Required ) 
        System.assertEquals(0, testAcc.size());
        
        System.assertEquals(0, testcontact.size());
        
    }
    
    
     @isTest
    public static void addStudenttoCohort_TEST3(){  // NEGATIVE BEHAVIOUR
    
          
           // Prepare Data
        
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            singleContact.LastName='STUDENT '+num;
            
			multiContact.add(singleContact);            
        }
        
        Boolean result=AccountHandler.addStudenttoCohort('',multiContact);
        
        
        // Test and Evaluate
         
        List<Contact> testcontact = [SELECT Id, Name, accountid, Account.Name FROM Contact];
        
        List<Account> testAcc = [SELECT id, Name FROM Account LIMIT 1];
        
        System.debug(testAcc);
        System.debug(testcontact);
        
        System.assertEquals(false, result); // account there is no name ( Required ) 
        System.assertEquals(0, testAcc.size());
        
        System.assertEquals(0, testcontact.size());
        
    
    }
    
    
    @isTest
    public static void addStudenttoCohort_TEST4(){  // UnAuthorized USER TEST
    
        // Prepare Data
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            singleContact.LastName='STUDENT '+num;
            
			multiContact.add(singleContact);            
        }
        
         // Unauthorized User....
     
        // Create a unique UserName
        String uniqueUserName = 'alexTestStandard' + DateTime.now().getTime() + '@cw.com';
        // This code runs as the system user
        Profile p = [SELECT Id FROM Profile WHERE Name='Minimum Access - Salesforce'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
         UserName=uniqueUserName);

        Boolean result;
        
        
        System.runAs(u) {   // alexTestStandard ------ @cw.com // Minimum Access - Salesforce   // no account + no contact access
              // The following code runs as user 'u'
              System.debug('Current User: ' + UserInfo.getUserName());
              System.debug('Current Profile: ' + UserInfo.getProfileId());
            
              result= AccountHandler.addStudenttoCohort('UnAuthorized Account TEST',multiContact);
            
            System.debug(result);  // FALSE
            
           
            
          }  // alexTestStandard ------ @cw.com 
        

			 // Test and Evaluate
		System.assertEquals(false, result);
    }
        
        
      
        
     
    
       @isTest
    public static void addStudenttoCohort_TEST5(){  // Authorized USER TEST
    
        // Prepare Data
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            singleContact.LastName='STUDENT '+num;
            
			multiContact.add(singleContact);            
        }
        
         // Unauthorized User....
     
        // Create a unique UserName
        String uniqueUserName = 'alexTestStandard' + DateTime.now().getTime() + '@cw.com';
        // This code runs as the system user
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
         UserName=uniqueUserName);

        Boolean result;
        
        
        System.runAs(u) {   // alexTestStandard ------ @cw.com // Standard User   // account + contact auth
              // The following code runs as user 'u'
              System.debug('Current User: ' + UserInfo.getUserName());
              System.debug('Current Profile: ' + UserInfo.getProfileId());
            
              result= AccountHandler.addStudenttoCohort('UnAuthorized Account TEST',multiContact);
            
            System.debug(result);  // TRUE
            
           
            
          }  // alexTestStandard ------ @cw.com 
        

			 // Test and Evaluate
			 System.assertEquals(true, result);   
    }