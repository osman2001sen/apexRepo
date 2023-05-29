Contact singleContact = [SELECT Id, Name, Phone, Email, Account.Name, Account.Phone FROM Contact 
                         WHERE Name = 'John Bond' LIMIT 1];

System.debug(singleContact);

System.debug(singleContact.Name);
System.debug(singleContact.Phone);
System.debug(singleContact.Email);
System.debug(singleContact.Account.Name);
System.debug(singleContact.Account.Phone);