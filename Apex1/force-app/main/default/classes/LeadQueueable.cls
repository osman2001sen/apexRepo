public class LeadQueueable implements Queueable {
    
    //properties/variables
  	List<Lead> multiLead = New List<Lead>();
    String LeadSourceStr;
    
    
    //Constructor method lazım parametre için
    public LeadQueueable (List<Lead> leadlist, String LeadSourceStr){ //Farklı isim koyduk yukarıdan. "This." demedik lead için.
       	multiLead=leadlist;
        this.LeadSourceStr=LeadSourceStr;
    }
    
    
    public void execute(QueueableContext context){            //Non-static. Ona göre çağıracağız.
        
        for(Lead singleLead:multiLead){
            singleLead.LeadSource=LeadSourceStr;
        }
        
        update multiLead;
    }
}