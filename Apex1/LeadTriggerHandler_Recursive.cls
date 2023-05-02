/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-01-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class LeadTriggerHandler {
    
    
    // Trigger.New,				Trigger.old,			Trigger.NewMap,				Trigger.OldMap
public static void beforeUpdate(List<Lead> triggerNew, List<Lead> triggerOld,Map<Id,Lead> TriggerNewMap, Map<Id,Lead> TriggerOldMap ){

for(Lead singleLead:triggerNew){  // Open - Not Contacted  , Working - Contacted

if(singleLead.Status=='Open - Not Contacted' && TriggerOldMap.get(singleLead.id).Status=='Working - Contacted'){
    singleLead.Status.addError('Your Old Status is ' + TriggerOldMap.get(singleLead.id).Status + ' You cannot reverse back...');
}

}


}    



// Trigger.New,Trigger.old,Trigger.NewMap,Trigger.OldMap
public static void afterUpdate(List<Lead> triggerNew, List<Lead> triggerOld,Map<Id,Lead> TriggerNewMap, Map<Id,Lead> TriggerOldMap ){



   if(!checkRecursive.firstcall){
       
       checkRecursive.firstcall=true;
       
       Set<Id> LeadSetId= New Set<Id>();
       
       for(Lead singleLead:triggerNew){
           
           if(singleLead.Status=='Open - Not Contacted'){
               LeadSetId.add(singleLead.id);
               
               // singleLead.Status='Working - Contacted';
           }
           
           
       }
       
       
       List<Lead> multiLead = [SELECT Id, FirstName,LastName, Status FROM Lead WHERE id=:LeadSetId ];
       
       for(Lead singleLead:multiLead){
           singleLead.Status='Working - Contacted';
       }
  
       update multiLead;
         
   }

}    

public static void afterInsert(List<Lead> triggerNew){

List<Task> multiTask = New List<Task>();  

for(Lead singleLead:triggerNew){


if(String.isBlank(singleLead.phone)){
   // Create Task...
   Task singleTask = New Task();
   singleTask.Subject  = 'APEX - Update Phone Number xyzabc123';
   singleTask.ActivityDate = date.Today()+10;
   singleTask.WhoId = singleLead.id; // LEAD ID.... Lookup...
   singleTask.OwnerId = singleLead.OwnerId;
   singleTask.Status='Not Started';
   singleTask.IsReminderSet=True;
   singleTask.ReminderDateTime=Date.Today();
   
   multiTask.add(singleTask);
   
   
}

}

insert multiTask;   

}

}  