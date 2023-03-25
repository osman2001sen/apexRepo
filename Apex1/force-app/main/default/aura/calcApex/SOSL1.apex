List<List<Sobject>> searchResult = [FIND 'united*' IN ALL FIELDS            
                                    RETURNING Account(Id, Name, Industry), 
                                    Contact(Id, Name, AccountId), 
                                    Opportunity(Id, Name, StageName, CloseDate)];


for(List<Sobject> search:searchResult){
    System.debug(search);
}