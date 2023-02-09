@isTest
public class LeadTest {
    
    @testSetup
    public static void setup(){ // Factory Setting
        
         // Prepare Data
        List<Lead> testLeads = New List<Lead>();
        
        for(Integer x=1;x<=200;x++){  // no phone....
            Lead slead = New Lead();
            
                slead.FirstName='test '+x;
                slead.LastName='test '+x;
               
                slead.Company='testCompany '+x;
            testLeads.add(slead);
            
            
        }
        
        for(Integer x=1;x<=200;x++){  // with Phone
            Lead slead = New Lead();
            
                slead.FirstName='test '+x;
                slead.LastName='test '+x;
                slead.phone='1111111111';
                slead.Company='testCompany '+x;
            testLeads.add(slead);
            
            
        }
        
       
        insert testLeads;  // Trigger Run LeadTrigger FistName,LastName and Company text Case Uppercase.
    }   // Factory Setting
    
    @isTest
    public static void leadTest1(){
        // is there any task records...
       	
        list<Lead> testLead  = [SELECT id, FirstName,LastName, Phone,Company,OwnerId,
                                (SELECT id,Subject,ActivityDate,WhoId,OwnerId, Status,IsReminderSet,ReminderDateTime 
                                 FROM TASKS) 
                                FROM LEAD];
        
        Integer countTask=0;
        
        for(Lead singleLead:testLead){  // 200 lead
             if(singleLead.tasks.size()!=0){
               countTask++; 
            }
             
        }
        
        System.debug('TOTAL LEAD  : '+testLead.size() );
        
        System.debug('How Many Task Created  : '+countTask );
        
        System.assertEquals(400, testLead.size() );
        
        System.assertEquals(200, countTask );
        
  
    }

}