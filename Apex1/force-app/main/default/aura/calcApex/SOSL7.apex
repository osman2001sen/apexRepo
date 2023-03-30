List<List<Sobject>> searchResult = [FIND 'edge' IN ALL FIELDS 
                                    RETURNING
                                    Account (Id, Name),
                                    Contact (Id, Name, AccountId),
                                    Opportunity(Id, Name, StageName, CloseDate, Amount),
                                    Case(Id, Reason, Origin)];

List<Account> accountList = searchResult.get(0); 
List<Contact> contactList = searchResult.get(1); 
List<Opportunity> oppList = searchResult.get(2);
List<Case> caseList = searchResult.get(3);

//System.debug(accountList);
//System.debug(contactList);

for(Account loopAcc:accountList){
    System.debug(loopAcc.Name);
}

for(Contact loopCont:contactList){
    System.debug(loopCont.Name);
}

for(Opportunity loopOpp:oppList){
    System.debug(loopOpp.Name +'Amount :'+loopOpp.Amount);
}

for(Case loopCase:caseList){
    System.debug(loopCase.Reason);
}