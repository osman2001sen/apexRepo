/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-16-2023
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
            acc.Industry = 'Manufacturing';
            accList.add(acc);
        }
        
        //Insert sample data so that the trigger is initiated
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        //SOQL Query that brings the first account created
        List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE AccountId=:accList[0].Id];
        
        //Apply assert condition
        System.assert(oppList!=null, 'Opportunity is not created.');
    }
}