@isTest
public class LeadTest {
    
    @testSetup				
    public static void setup(){
        
        //Prepare DATA
        List<Lead> testLeads = New List<Lead>();
        
        for(Integer x=1;x<=10;x++){
            
		Lead slead = New Lead();
            
                slead.FirstName='test '+x;
                slead.LastName='test '+x;
                slead.Company='testCompany '+x;

        	testLeads.add(slead);
            
        }
        
        insert testLeads; 		// Trigger Run LeadTrigger FistName,LastName and Company text Uppercase. 
    }
    
    @isTest
    public static void leadTest1(){
        
               
        //Test and Evaluate
        
        List<Lead> multiTest = [SELECT id,firstName,LastName,Company FROM Lead ];
        										
        system.debug('Trigger Result : '+ multiTest);
        
	
	Integer x=1;

        for(Lead testLead:multiTest){
           System.assertEquals('TEST '+x, testLead.firstName);
            x++;
            
        }
        
    }

}