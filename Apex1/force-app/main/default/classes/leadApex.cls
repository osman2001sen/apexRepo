public class leadApex {
    
//properties

//methods
    public static void getLead(String eyalet, String sirket){
        List<Lead> multiLead = [SELECT Id, FirstName, LastName, Title, Phone, Email, Company, State 
                                FROM Lead 
                                WHERE State=:eyalet OR Company=:sirket]; //SOQL (Get records yaptı - all leads)

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