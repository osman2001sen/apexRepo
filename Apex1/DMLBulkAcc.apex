List<Account> multiAcc = New List<Account>();

for(Integer num=1; num<=300; num++){
    
    Account singleAcc = New Account();

    singleAcc.Name = 'Bulk Acc - Apex '+num;
    
    multiAcc.add(singleAcc);
    
}

insert multiAcc;