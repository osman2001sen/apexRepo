public class LeadSchedulable implements Schedulable {
    
    public void execute(SchedulableContext SC){
        List<Lead> multiLead = [SELECT Id, FirstName, LastName, Phone, Email FROM Lead LIMIT 200];
        
        for(Lead singleLead: multiLead){
            singleLead.FirstName = singleLead.FirstName.capitalize();
            singleLead.LastName = singleLead.LastName.toUpperCase();
        }
        
        update multiLead;
    }

}