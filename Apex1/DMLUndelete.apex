List<Account> deletedAccounts = [SELECT Name, isDeleted FROM Account WHERE isDeleted=true ALL ROWS];
System.debug(deletedAccounts);

undelete deletedAccounts;