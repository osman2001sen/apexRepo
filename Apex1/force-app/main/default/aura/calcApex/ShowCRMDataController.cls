/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-18-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class crmExtractor {
    
    public static List<Book__c> bookList{get;set;}          //Variable
    
    public static void getBookList(){				//Method
        
        bookList=[SELECT Id, Name FROM Book__c];
        
    }

}