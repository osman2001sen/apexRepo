List<Account> companies = [SELECT Id, Name, Industry, Phone FROM Account];

for(Account acc:companies){
    System.debug(acc.name);
}