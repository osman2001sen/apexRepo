/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-01-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger LeadTrigger on Lead (before insert, before update, before delete,
after insert,after update,after delete,after undelete)  {
        
        switch on Trigger.OperationType {
            
            when BEFORE_INSERT {
                
            }
            when BEFORE_UPDATE {
                
                LeadTriggerHandler.beforeUpdate(Trigger.New,Trigger.old,Trigger.NewMap,Trigger.OldMap);
                
           }
            when BEFORE_DELETE {}
            
            
            // Record Id .... Relation ... 
            when AFTER_INSERT {
                LeadTriggerHandler.afterInsert(Trigger.New);                                      
            }
              when AFTER_UPDATE {
                  LeadTriggerHandler.afterUpdate(Trigger.New,Trigger.old,Trigger.NewMap,Trigger.OldMap);
                 
            } 
          
            when AFTER_DELETE {}
            
            when AFTER_UNDELETE {}
           
        }  
        
    }
