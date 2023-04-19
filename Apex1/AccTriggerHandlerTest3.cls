/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-19-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountTriggerHandlerTest {
	@isTest
    public static void changeRatingTest(){
        
        //Create Sample Data in Test CRM
        List<Account> accList = new List<Account>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account();
            acc.Name = 'TestAcc' + i;
            acc.Industry = 'Manufacturing';
            accList.add(acc);
        }
        
        //Insert sample data so that the trigger is initiated
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        //SOQL Query that brings the first account created
        List<Account> changedAccList = [SELECT Id, Rating FROM Account WHERE Id=:accList[0].Id];
        
        //Apply assert condition
        System.assertEquals('Hot', changedAccList[0].Rating);
    }
    
    @isTest
    public static void createRelatedOpportunityTest(){
        
        //Create Sample Data in Test CRM
        List<Account> accList = new List<Account>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account();
            acc.Name = 'TestAcc Opp' + i;
            accList.add(acc);
        }
        
        //Insert sample data so that the trigger is initiated
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        //SOQL Query that brings the first Opp created
        List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE AccountId=:accList[0].Id];
        
        //Apply assert condition
        System.assert(oppList!=null, 'Opportunity is not created.');
    }
    
    @isTest
    public static void updateAccountDescTest(){
        
        //Create Sample Data in Test CRM
        List<Account> accList = new List<Account>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account();
            acc.Name = 'TestforUpdate' + i;
            acc.Phone = '6402402040';
            accList.add(acc);
        }
        
        //Insert sample data 
        Test.startTest();
        insert accList;
        
        //Update the account records so that the trigger is initiated
        for(Account acc:accList){
            acc.Phone='6402400000';
        }
        
        update accList;
        Test.stopTest();
        
        //SOQL Query that brings the first account updated
        List<Account> updatedAccountList = [SELECT Id, Phone FROM Account WHERE Id=:accList[0].Id];
        
        //Apply assert condition
        System.assertEquals('6402400000', updatedAccountList[0].Phone, 'Phone was not updated!');
    }
}