/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-12-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public class CaseControllerTest {
    
    @IsTest
    public static void testCreateCase() {
        // Test data
        String subject = 'Test Subject';
        String description = 'Test Description';
        
        // Call the method
        Test.startTest();
        CaseController.createCase(subject, description);
        Test.stopTest();
        
        // Verify the case was created
        List<Case> cases = [SELECT Id, Subject, Description FROM Case WHERE Subject = :subject];
        System.assertEquals(1, cases.size());
        System.assertEquals(subject, cases[0].Subject);
        System.assertEquals(description, cases[0].Description);
    }
    
    @IsTest
    public static void testUpdateCase() {
        // Test data
        Case testCase = new Case(Subject = 'Test Subject', Description = 'Test Description');
        insert testCase;
        String newSubject = 'Updated Subject';
        String newDescription = 'Updated Description';
        
        // Call the method
        Test.startTest();
        CaseController.updateCase(testCase.Id, newSubject, newDescription);
        Test.stopTest();
        
        // Verify the case was updated
        Case updatedCase = [SELECT Id, Subject, Description FROM Case WHERE Id = :testCase.Id];
        System.assertEquals(newSubject, updatedCase.Subject);
        System.assertEquals(newDescription, updatedCase.Description);
    }
    
    @IsTest
    public static void testCloseCase() {
        // Test data
        Case testCase = new Case(Subject = 'Test Subject', Description = 'Test Description');
        insert testCase;
        
        // Call the method
        Test.startTest();
        CaseController.closeCase(testCase.Id);
        Test.stopTest();
        
        // Verify the case was closed
        Case closedCase = [SELECT Id, Status FROM Case WHERE Id = :testCase.Id];
        System.assertEquals('Closed', closedCase.Status);
    }
    
    @IsTest
    public static void testGetOpenCases() {
        // Test data
        Case openCase = new Case(Subject = 'Open Case', Description = 'Open Case Description', Status = 'New');
        Case closedCase = new Case(Subject = 'Closed Case', Description = 'Closed Case Description', Status = 'Closed');
        insert openCase;
        insert closedCase;
        
        // Call the method
        Test.startTest();
        List<Case> openCases = CaseController.getOpenCases();
        Test.stopTest();
        
        // Verify the open cases were returned
        System.assertEquals(1, openCases.size());
        System.assertEquals(openCase.Subject, openCases[0].Subject);
        System.assertEquals(openCase.Description, openCases[0].Description);
        System.assertEquals(openCase.Status, openCases[0].Status);
    }
}
