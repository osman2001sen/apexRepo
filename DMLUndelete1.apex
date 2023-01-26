List<Account> a=[SELECT ID, IsDeleted, Name FROM Account ALL ROWS];
List<Account> b=New List<Account>();

for(Account c:a){
    if(c.IsDeleted==True){
        b.add(c);
    }
}

undelete b;