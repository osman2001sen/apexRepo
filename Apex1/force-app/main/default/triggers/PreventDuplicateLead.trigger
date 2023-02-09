trigger PreventDuplicateLead on Lead (before insert, before update, before delete,                             
                             			after insert,after update, after delete, after undelete) {
                                            
                               switch on Trigger.OperationType {
                                     
                                     // field update / Validation Rule
                                    
                                 
                                     when BEFORE_INSERT {
                                   
                                         	set<string> newFirstName = new set<string>();

    										set<string> newLastName = new set<string>();

    										set<string> duplicateFirstName = new set<string>();

    										set<string> duplicateLastName  = new set<string>();
                                         
                                         	for(Lead newLead : Trigger.New){

        										newFirstName.add(newLead.FirstName);

        										newLastName.add(newLead.LastName);
					
    										}
                                         
                                         	for(Lead duplicateLead : [SELECT Id, FirstName, LastName FROM Lead WHERE FirstName IN: newFirstName OR LastName IN: newLastName]){

        										duplicateFirstName.add(duplicateLead.FirstName);

        										duplicateLastName.add(duplicateLead.LastName);

    										}
                                         
                                         	for(Lead newLead : trigger.new){

                                                if((duplicateFirstName.contains(newLead.FirstName)) && (duplicateLastName.Contains(newLead.LastName))){

            									newLead.FirstName.addError('You are trying to insert a Duplicate Lead');

    										}
                                         
                                    }
                                     /*when BEFORE_UPDATE {
                                         
                                         LeadTriggerHandler.beforeUpdate(Trigger.New,Trigger.old,Trigger.NewMap,Trigger.OldMap);
                                         
                                         
                                     }
                                     when BEFORE_DELETE {}
                                  
                                     
                                     // Record Id .... Relation ... 
                                     when AFTER_INSERT {
                                         LeadTriggerHandler.afterInsert(Trigger.New);                                      
                                     }
                                     
                                    
                                     when AFTER_UPDATE {
                                         
                                         //LeadTriggerHandler.afterUpdate(Trigger.New,Trigger.old,Trigger.NewMap,Trigger.OldMap);
                                         
                                         
                                         
                                         
                                     }
                                     
                                     
                                      
                                     when AFTER_DELETE {}
                                     
                                     when AFTER_UNDELETE {}

                                
                                     
                                     
                                 }    */                        
                                 
							}
                   }
}