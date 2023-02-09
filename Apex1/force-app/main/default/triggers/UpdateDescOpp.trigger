trigger UpdateDescOpp on Opportunity (before insert, before update) {
	
    for (Opportunity opp:Trigger.new){
        
        if(Trigger.isInsert){
            opp.Description='This Opportunity was created by ' + UserInfo.getName();
        }
        
        if(Trigger.isUpdate){
            opp.Description='This Opportunity was updated by ' + UserInfo.getName();
        }
    }
}