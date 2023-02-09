public class LeadFuture {
    
    @future //(callout=true);
    public static void updatePhone(String CompanyName, String Phone){
        System.debug('future method basladı');
        List<Lead> multiLead= [SELECT Id, FirstName, LastName, Company, Phone
                              FROM Lead
                              WHERE Company=:CompanyName];
        
        for(Lead singleLead:multiLead){
            singleLead.Phone=Phone;
        }
        
        update multiLead;
        System.debug('future method bitti');
        
        //http request > apollo > linkedin > facebook > twitter...
    }
    
}