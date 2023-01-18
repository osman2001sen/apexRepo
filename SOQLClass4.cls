public class leadApex {
    
    public static void getLead(String state, String company{
            List<Lead> multiLead = [SELECT Id, FirstName, LastName, Title, Phone, Email, Company, State 
                                    FROM Lead 
                                    WHERE State=:state AND Company=:company];
    
            for(Lead singleLead:multiLead){
                    System.debug(singleLead.Company);
                System.debug(singleLead.State);
                System.debug(singleLead.FirstName);
                System.debug(singleLead.LastName);
                System.debug(singleLead.Phone);
                System.debug('============================');
            }
        }
    }
    
    //Anonymous Screen
    
    leadApex.getLead('FL', 'FARMERS COOP. OF FLORIDA');