@isTest
public class UpdateDescriptionTest{
    
    @testSetup
    public static void UpdateLeadDesTest(){
        List<Lead> multiLead=new List<Lead>();
        
        for(integer i=1;i<=10;i++){
            Lead testlead=new Lead();
            testlead.lastName='Developer Tuba'+i;
            testlead.Company='London IBM'+i;
            testlead.Status='Working - Contacted';
            multiLead.add(testlead);
        }
        insert multiLead;   //10 Leads with required fields are created in the Test CRM. We have 10 IDs for them.
    }
    
    @istest
    public static void Leadtest(){
        UpdateDescription.UpdateLeadDes();
        List<Lead> testList=[SELECT Id,Description FROM Lead];
        
        System.debug(testList);
        
        for(Lead newLead:testList){
            String actual = newLead.Description;
            System.assertEquals('This lead\'s description was updated to apply bulk apex tests.', actual);
            
        }
        System.assertEquals(10, testList.size());
    }

}