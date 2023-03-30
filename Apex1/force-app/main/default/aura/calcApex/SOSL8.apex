List<List<Sobject>> searchResult = [FIND '@uog.com' IN Email FIELDS 
                                    RETURNING
                                    Account (Id, Name),
                                    Contact (Name),
                                    Opportunity(Name, Amount)]; //Same search in SOQL should search for {@uog.com}
//System.debug(searchResult);

List<Contact> multiCont=searchResult.get(1);

for(Contact singleCont:multiCont){
    System.debug(singleCont.Name);
}