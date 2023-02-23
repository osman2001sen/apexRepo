/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-22-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class crmExtractor {
    
    public static List<Book__c> bookList{get;set;}          
    
    public static void getBookList(){				
        
        bookList=[SELECT Id, Name FROM Book__c];
        
    }

}