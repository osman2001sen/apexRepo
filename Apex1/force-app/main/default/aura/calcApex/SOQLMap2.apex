Map<Id, Account> mapAccount = New Map<Id,Account>([SELECT Id, Name, ParentId, Phone, Fax, 
                                                   AccountNumber, Website,
                                                   Industry, AnnualRevenue 
                                                   FROM Account
                                                   WHERE ParentId=Null]);

Map<String, Account> nameToAccMap = New Map<String, Account>();

Set<Id> accountIds=mapAccount.keyset();

for(Id accId:accountIds){
	Account singleAcc = mapAccount.get(accId);
	nameToAccMap.put(singleAcc.Name, singleAcc);
}

Account edge=nameToAccMap.get('Edge Communications'); 
System.debug(edge.Phone);								

Map<Id,Contact> mapContact = New Map<Id, Contact>([SELECT Id, Name, AccountId FROM Contact WHERE AccountId=:accountIds]);
															      
