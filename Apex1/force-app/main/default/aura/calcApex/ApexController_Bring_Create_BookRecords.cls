/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class crmExtractor {
    
    public static List<Book__c> bookList{get;set;}          //Variable
    public static String name{get;set;}						//New Variable
    
    public static void getBookList(){						// Method
        
        bookList=[SELECT Id, Name FROM Book__c];
        
    }
    
    public static void createRecord(){						// New Method
        
        Book__c cR = New Book__c();
        cR.Name=name;
        insert cR;
    }

}