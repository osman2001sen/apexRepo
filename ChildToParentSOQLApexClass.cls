List<Contact> get_Contact = [SELECT Id, FirstName, LastName, Phone, Title, 
                             Email, Department, 
                             Account.Name FROM Contact];

for (Contact loopContact:get_Contact){
    System.debug(loopContact.FirstName);
    System.debug(loopContact.LastName);
    System.debug(loopContact.Account.Name);
    System.debug('---------------------');
}     