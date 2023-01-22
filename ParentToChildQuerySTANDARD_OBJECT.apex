List<Account> multiAccount = [SELECT Id, Name, Type, Phone, Industry, AnnualRevenue, 
				            (SELECT Id, Name, Phone, Email, Title, Department FROM Contacts), 
				            (SELECT Id, Name, Amount, CloseDate, StageName, IsWon FROM Opportunities) 
				            FROM Account];


for(Account singleAccount:multiAccount){
    System.debug('---'+singleAccount.Name+ '/'+singleAccount.Phone);
    
    for(Contact singleContact:singleAccount.Contacts){
        System.debug('---'+singleContact.Name);
    }
    
    for(Opportunity singleOpportunity:singleAccount.Opportunities){
        System.debug('---'+singleOpportunity.Amount +'/' +singleOpportunity.closeDate);
    }
    
}
