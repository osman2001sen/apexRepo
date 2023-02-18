/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-18-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class bookClass {
    
    public static Book__c singleRec{get;set;}
    public static String newName{get;set;}
    
    public static list<Book__c> getBookRecords(){
        
        list<Book__c> x=[SELECT Id, Name FROM Book__C];
        return x;
    }
    
    public PageReference delMethod(){
        string comingDelId=system.currentPageReference().getParameters().get('delId');
        Book__c d=[SELECT Id, Name FROM Book__c WHERE Id=:comingDelId];
        delete d;
        return NULL;
    }
    
    public PageReference showMethod(){
        string comingShowId=system.currentPageReference().getParameters().get('showId');
        singleRec=[SELECT Id, Name FROM Book__c WHERE Id=:comingShowId];
        PageReference nextPage=New PageReference('/apex/detailPage?id='+comingShowId);
        return nextPage;
    }
    
    public PageReference updateMethod(){
        string comingUpdateId=system.currentPageReference().getParameters().get('updateId');
        Book__c u=[SELECT Id, Name FROM Book__c WHERE Id=:comingUpdateId];
        u.Name= newName;
        update u;
        PageReference nextP=New PageReference('/apex/bookHome');
        return nextP;
    }

}