List<Account> multiAcc = New List<Account>();

for(Integer num=1;num<=300;num++){
    
    Account singleAcc = New Account();  
  
    singleAcc.Name ='Bulk Acc - Apex '+num; 
  
    multiAcc.add(singleAcc);	    
}

Account singleAccERROR = New Account();

singleAccERROR.phone='234234234234';

multiAcc.add(singleAccERROR);

insert multiAcc;    