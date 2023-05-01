List<AggregateResult> getOpportunity = [SELECT Account.Name,
                                        SUM(Amount), MIN(Amount), MAX(Amount), AVG(Amount) 
                                        FROM Opportunity 
                                        GROUP BY Account.Name];                     

for(AggregateResult AR:getOpportunity){
    //System.debug(AR);
    System.debug(AR.get('Name'));
    System.debug('SUM_Amount: ' + AR.get('expr0'));
    System.debug('--------------------');
}