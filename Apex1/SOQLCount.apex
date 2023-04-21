List<Opportunity> getOpportunity = [SELECT Account.Name, 
                                    Id, Name, Amount, CloseDate 
                                    FROM Opportunity 
                                    WHERE CloseDate = LAST_N_DAYS:45];

System.debug(getOpportunity);
System.debug(getOpportunity.size());

for (Opportunity loopOpp:getOpportunity){
     System.debug(loopOpp);
}