/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountHandlerTest {
    
    @isTest
    public static void createTest1(){
        
        AccountHandler.create('TEST ACCOUNT');
        
        Account actual = [SELECT Id, Name FROM Account WHERE Name='TEST ACCOUNT' LIMIT 1];
	
        System.assertEquals('TEST ACCOUNT', actual.name);
}