List<Contact> contacts = [SELECT Id, Name, Account.Name FROM Contact WHERE Account.Name = 'Acme Corp'];
