List<List<Sobject>> searchResult = [FIND 'edge' IN ALL FIELDS 
                                    RETURNING
                                    Account (Id, Name),
                                    Contact (Id, Name, AccountId),
                                    Opportunity(Id, Name, StageName, CloseDate),
                                    Case(Id, Reason, Origin)];

List<Account> accountList = searchResult.get(0); 
List<Contact> contactList = searchResult.get(1);
//System.debug(accountList);
//System.debug(contactList);

for(Account loopAcc:accountList){
    System.debug(loopAcc.Name);
}

for(Contact loopCont:contactList){
    System.debug(loopCont.Name);
}