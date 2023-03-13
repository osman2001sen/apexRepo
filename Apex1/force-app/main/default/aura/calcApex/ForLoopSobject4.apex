List<Account> companies = [SELECT id, Name, Industry, Phone FROM Account];

for(Account acc:companies){
    
    if(acc.Name.toUpperCase()=='EDGE COMMUNICATIONS'){
        System.debug(acc.name+'-'+acc.Phone+'-'+acc.Industry);
    }
}