/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-11-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CaseController {
    public static void createCase(String subject, String description) {
        Case newCase = new Case();
        newCase.Subject = subject;
        newCase.Description = description;
        
        insert newCase;
    }
    
    public static void updateCase(String caseId, String subject, String description) {
        Case existingCase = [SELECT Id, Subject, Description FROM Case WHERE Id = :caseId];
        
        existingCase.Subject = subject;
        existingCase.Description = description;
        
        update existingCase;
    }
    
    public static void closeCase(String caseId) {
        Case existingCase = [SELECT Id, Status FROM Case WHERE Id = :caseId];
        
        existingCase.Status = 'Closed';
        
        update existingCase;
    }
    
    public static List<Case> getOpenCases() {
        List<Case> openCases = [SELECT Id, Subject, Description, Status FROM Case WHERE Status != 'Closed'];
        
        return openCases;
    }
}
