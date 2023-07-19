/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-18-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class LeadQueueable implements Queueable {
    
    public void execute(QueueableContext context){            
        
        List<Lead> multiLead = [SELECT Id, Name, LeadSource 
                                FROM Lead
                                WHERE LeadSource=Null];
        
        for(Lead singleLead:multiLead){
            singleLead.LeadSource='Other';
        }
        
        update multiLead;
    }
}