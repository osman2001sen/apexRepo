List<List<Sobject>> searchResult = [FIND 'united*' IN ALL FIELDS 
                                    RETURNING Account(Id, Name, Industry), 
                                    Contact(Id, Name, AccountId), 
                                    Opportunity(Id, Name, StageName, CloseDate)];

//System.debug(searchResult);

for(List<Sobject> listofSobject:searchResult){
    //System.debug(search);
    for(Sobject sobj:listofSobject){
        System.debug(sobj);
    }
}