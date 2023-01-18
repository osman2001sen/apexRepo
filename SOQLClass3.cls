public class leadApex {
    
    public static void getLead(String state){
        List<Lead> multiLead = [SELECT Id, FirstName, LastName, Title, Phone, Email, Company 
                                FROM Lead 
                                WHERE State=:state]; //VARIABLE BINDING

		for(Lead singleLead:multiLead){
   	 		System.debug(singleLead.Company);
            System.debug(singleLead.FirstName);
            System.debug(singleLead.LastName);
    		System.debug(singleLead.Phone);
    		System.debug('============================');
		}
    }
}

//Anonymous Screen

leadApex.getLead('FL');

leadApex.getLead('CA');

leadApex.getLead('IL');