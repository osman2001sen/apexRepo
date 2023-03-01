/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-01-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountTest {
    
    
    @isTest
    public static void Test1(){
        Test.startTest();
        TestDataFactory.createAcc(1);
        Test.stopTest();
        
        Account a=[SELECT Type FROM Account];
        System.assertEquals('Prospect', a.Type);
    }
    
    @isTest
    public static void Test2(){
        Test.startTest();
        TestDataFactory.createAcc(10);
        Test.stopTest();
        
        List<Account> accList=[SELECT Type FROM Account];
        for(Account a:accList){
            System.assertEquals('Prospect', a.Type);
        }
        
    }
    
    @isTest
    public static void Test3(){
        Test.startTest();
        TestDataFactory.createAcc(1);
        Account a=[SELECT Type FROM Account];
        a.AnnualRevenue=123456;
        update a;
        Test.stopTest();
        
        Account acc=[SELECT Description FROM Account];
        System.assertEquals('This Account is updated by ' + UserInfo.getName(), acc.Description);
    }
    
    @isTest
    public static void Test4(){
        Test.startTest();
        TestDataFactory.createAcc(10);
        List<Account> accList=[SELECT Type FROM Account];
        List<Account> newaccList= new List<Account>();
        for(Account a:accList){
            a.AnnualRevenue=123456;
            newaccList.add(a);
        }
        update newaccList;
        Test.stopTest();
        
        List<Account> accList2=[SELECT Description FROM Account];
        for(Account acc:accList2){
            System.assertEquals('This Account is updated by ' + UserInfo.getName(), acc.Description);
        } 
    }
}