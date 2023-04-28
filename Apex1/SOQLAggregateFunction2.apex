List<AggregateResult> getOpportunity = [SELECT MIN(Amount), MAX(Amount), AVG(Amount), SUM(Amount)   
                             			FROM Opportunity
                                       	WHERE CloseDate=LAST_N_DAYS:45];


Decimal Min = (Decimal)getOpportunity.get(0).get('expr0');                                         
									  
System.debug('MinAmount: ' +Min);
System.debug('MaxAmount: ' +getOpportunity.get(0).get('expr1'));
System.debug('AvgAmount: ' +getOpportunity.get(0).get('expr2'));
System.debug('SumAmount: ' +getOpportunity.get(0).get('expr3'));