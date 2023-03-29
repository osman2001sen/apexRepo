List<List<Sobject>> searchResult = [FIND 'edge' IN ALL FIELDS 
                                    RETURNING
                                    Account (Id, Name),
                                    Contact (Id, Name),
                                    Opportunity(Id, Name, StageName, CloseDate),
                                    Case(Id)];

//System.debug(searchResult);

for(List<Sobject> listofSobject:searchResult){
    //System.debug(search);
    for(Sobject sobj:listofSobject){
        System.debug(sobj);
    }
}