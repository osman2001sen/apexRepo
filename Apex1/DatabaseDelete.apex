List<Account> delAcc = [SELECT Id, Name FROM Account WHERE Name LIKE '%Bulk%'];

Database.delete(delAcc, true);   