@istest
public class AccountTriggerTest {

    @istest
    public static void testAccountTrigger(){
        Account acc = new Account();
        acc.Name = 'test Trigger Account';
        acc.AnnualRevenue = 200000;
        acc.CustomerPriority__c = 'Low';
        
        insert acc;
        
        Account singleAcc = [SELECT Name, Description FROM Account WHERE Id = : acc.Id];
        System.assertEquals('Account Priority is : Low', singleAcc.Description);
        System.assertEquals('TEST TRIGGER ACCOUNT', singleAcc.name);
        
        acc.Name = 'Updated AccountName';
        acc.AnnualRevenue = 2000000;
        acc.CustomerPriority__c = 'High';
        update acc;
        singleAcc = [SELECT Name, Description,AnnualRevenue FROM Account WHERE Id = : acc.Id];
        System.assertEquals('Account Priority is : High', singleAcc.Description);
        System.assertEquals('UPDATED ACCOUNTNAME', singleAcc.name);
      
        
    }
}