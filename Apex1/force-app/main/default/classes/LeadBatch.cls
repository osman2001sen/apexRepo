public class LeadBatch implements Database.Batchable<Sobject>{      
    
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator([SELECT Id, FirstName, LastName, Company, 
                                         LeadSource, Phone, Email FROM Lead]);      
    }
    
   
    public void execute(Database.BatchableContext BC, List<Lead> scope){
        for(Lead s:scope){					
            s.FirstName = s.FirstName.toUpperCase();
            s.LastName = s.LastName.toUpperCase();
           
        }
        
        update scope;
    }
    
    
   
    public void finish(Database.BatchableContext BC){ 
        System.debug('Lead Batches are finished.');
    }

}