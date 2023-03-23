/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-22-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class LeadTest {
    
    @isTest
    public static void leadTest1(){
        
        Lead testLead = New Lead();   
        
        testLead.FirstName='test 1';
        testLead.LastName='test 1';
        testLead.Company='testCompany 1';
        
        insert testLead; 
        
        Lead result = [SELECT Id, FirstName, LastName, Company FROM Lead];
        
        system.debug('Trigger Result: '+result);
	
	System.assertEquals('TEST 1', result.FirstName);
	System.assertEquals('TEST 1', result.LastName);
	System.assertEquals('TESTCOMPANY 1', result.Company); 
        
    }

}