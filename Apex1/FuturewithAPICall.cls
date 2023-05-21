/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-20-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class LeadFuture {
    
    @future (callout=true);
    public static void updatePhone(String CompanyName, String Phone){
        System.debug('future method starts');
        List<Lead> multiLead= [SELECT Id, FirstName, LastName, Company, Phone
                              FROM Lead
                              WHERE Company=:CompanyName];
        
        for(Lead singleLead:multiLead){
            singleLead.Phone=Phone;
        }
        
        update multiLead;
        System.debug('future method ends');
        
        //http request
    }
    
}