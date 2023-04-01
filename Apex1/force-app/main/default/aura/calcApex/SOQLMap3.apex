Map<Id, Account> mapAccount = New Map<Id,Account>([SELECT Id, Name, ParentId, Phone, Fax, 
                                                   AccountNumber, Website,
                                                   Industry, AnnualRevenue 
                                                   FROM Account
                                                   WHERE ParentId=Null]);

Map<String, Account> nameToAccMap = New Map<String, Account>();

Set<Id> accountIds=mapAccount.keyset();

for(Id accId:accountIds){
	Account singleAcc = mapAccount.get(accId);
	nameToAccMap.put(singleAcc.Name.toUpperCase(), singleAcc);
}

Account edge=nameToAccMap.get('Edge Communications'.toUpperCase());
System.debug(edge.Phone);	
