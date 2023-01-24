public class LeadSchedulable implements Schedulable {
    
    public void execute(SchedulableContext SC){
        List<Lead> multiLead = [SELECT Id, FirstName, LastName, Phone, Email FROM Lead LIMIT 200];
        
        for(Lead singleLead: multiLead){
            singleLead.FirstName = singleLead.FirstName.capitalize();
            singleLead.LastName = singleLead.LastName.toLowerCase();
        }
        
        update multiLead;
    }

}

//Anonymous Window

/*

LeadSchedulable LS = New LeadSchedulable();

String cronStr='0 0 20-23 ? * * *';

System.schedule('Scheduled Lead', cronStr, LS);

*/