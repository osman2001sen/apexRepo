/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-15-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class LeadBatch implements Database.Batchable<Sobject>{      
    //Start   
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator ('SELECT Id FROM Lead');      
    }
    
    //Execute			
    public void execute(Database.BatchableContext BC, List<Lead> scope){
        for(Lead s: scope){					
            s.LeadSource='Other';
        }
        
        update scope;
    }
    
    
    //Finish
    public void finish(Database.BatchableContext BC){
        System.debug('Lead Batches are finished.');
    }

}