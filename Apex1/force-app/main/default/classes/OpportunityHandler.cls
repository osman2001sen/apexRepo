public class OpportunityHandler {
	
    public static list<Opportunity> getNDays(Integer n){
        String query='SELECT Account.Name, Id, Name, Amount, CloseDate FROM Opportunity WHERE CloseDate = LAST_N_DAYS:' +n;
        list<Opportunity> multiOp=Database.query(query); //Dynamic Query: Hack'lenmeye çok müsait. Koruma kodu yazman lazım.
        return multiOp;
    }
}