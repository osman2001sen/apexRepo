trigger LeadTrigger on Lead (after update) {
   
   
   if(!checkRecursive.firstCall){
   
   	checkRecursive.firstCall=true;
      
      	Set<Id> leadSetId=New Set<Id>();
            
	for(Lead singleLead:Trigger.new){
            leadSetId.add(singleLead.id);
            //singleLead.Status='Working - Contacted';
            }
            
            List<Lead> multiLead = [SELECT Id, FirstName,LastName, Status WHERE Id=:leadSetId];
            
            
            for(Lead singleLead:multiLead){
            	singleLead.Status='Working - Contacted';
            }
            
            update multiLead;
   }
}	