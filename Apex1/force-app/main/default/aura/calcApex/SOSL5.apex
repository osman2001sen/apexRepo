List<List<Sobject>> searchResult = [FIND 'edge' IN ALL FIELDS 
                                    RETURNING
                                    Account (Id, Name),
                                    Contact (Id, Name, AccountId),
                                    Opportunity(Id, Name, StageName, CloseDate),
                                    Case(Id, Reason, Origin)];

//System.debug(searchResult);

for(List<Sobject> listofSobject:searchResult){
    //System.debug(search);
    for(Sobject sobj:listofSobject){
        System.debug(sobj);
    }
}