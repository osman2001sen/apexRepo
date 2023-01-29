@isTest
public class AccountCreaterTest {
    
	@isTest
    public static void testCreateAcc(){
        String accName = 'test AccountCreate';
        Integer accAnnualRevenue = 200000;
        AccountCreater.createAcc(accName, accAnnualRevenue);
        
        Account createdAccount = [SELECT name,Annualrevenue FROM Account WHERE name =: accName LIMIT 1 ];
        
        System.assertEquals('TEST ACCOUNTCREATE', createdAccount.Name);
        System.assertEquals(200000, createdAccount.AnnualRevenue);
        
        
    }
    
    @testSetup
    public static void setup(){
        
        Account acc = new Account();
        acc.Name = 'test Account';
        acc.AnnualRevenue = 2000000;
        insert acc;
    }
    
    @isTest
    public static void testAccPriority(){
        
        Account acc = [SELECT name,Annualrevenue FROM Account WHERE name =: 'test Account' LIMIT 1 ];
        String priority = AccountCreater.accPriority(acc.name);
        assert.areEqual('High', priority) ;
        
        acc.AnnualRevenue = 750000;
        update acc;
		priority = AccountCreater.accPriority(acc.name);
        assert.areEqual('Medium', priority) ;
        
        acc.AnnualRevenue = 250000;
        update acc;
        priority = AccountCreater.accPriority(acc.name);
        assert.areEqual('Low', priority) ;      
        
    }
    
}