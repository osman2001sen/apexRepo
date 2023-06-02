/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class MyApexTestClass {
    @testSetup
    static void setupTestData() {
        // Test data setup logic
        List<Contact> testContacts = new List<Contact>();
        
        // Create test records
        for (Integer i = 0; i < 5; i++) {
            Contact c = new Contact(
                FirstName = 'Test' + i,
                LastName = 'Contact' + i,
                Email = 'test' + i + '@example.com'
            );
            testContacts.add(c);
        }
        
        insert testContacts;
    }
    
    @isTest
    static void myTestMethod() {
        // Test method logic
        List<Contact> testContacts = [SELECT Id, FirstName, LastName, Email FROM Contact];
        
        // Perform your test assertions and verifications here
        System.assertEquals(5, testContacts.size(), 'Number of test contacts should be 5');
        
        
        for (Contact c : testContacts) {
            System.assertNotEquals(null, c.Email, 'Email should not be null');
            System.assertEquals(true, c.Email.endsWith('@example.com'), 'Email should end with @example.com');
        }
    }
}
