/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class LeadFuture {
    
    @future
    public static void updatePhone(String CompanyName, String Phone){
        System.debug('future method started');
        List<Lead> multiLead= [SELECT Id, FirstName, LastName, Company, Phone
                              FROM Lead
                              WHERE Company=:CompanyName];
        
        for(Lead singleLead:multiLead){
            singleLead.Phone=Phone;
        }
        
        update multiLead;
        System.debug('future method finished');
    }
    
}