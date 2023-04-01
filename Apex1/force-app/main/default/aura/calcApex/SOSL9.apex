Map<Id, Account> mapAccount = New Map<Id,Account>([SELECT Id, Name, ParentId, Phone, Fax, 
                                                   AccountNumber, Website,
                                                   Industry, AnnualRevenue 
                                                   FROM Account
                                                   WHERE ParentId=Null]);


Set<Id> accountIds=mapAccount.keyset();

for(Id accId:accountIds){
	Account singleAcc = mapAccount.get(accId); 
	System.debug(singleAcc.Name);
	System.debug(singleAcc.ParentId);
	System.debug(singleAcc.Phone);
}