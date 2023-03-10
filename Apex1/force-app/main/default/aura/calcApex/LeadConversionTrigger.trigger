/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CreateAccountContactOpp on Lead (after update) {
    List<Account> accountList = new List<Account>();
    List<Contact> contactList = new List<Contact>();
    List<Opportunity> oppList = new List<Opportunity>();

    for (Lead l : Trigger.new) {
        if (l.IsConverted && !l.IsConverted()) {
            // Get the converted Lead's Account and Contact
            Account acct = [SELECT Id, Name FROM Account WHERE Id = :l.ConvertedAccountId];
            Contact con = [SELECT Id, Name, Email FROM Contact WHERE Id = :l.ConvertedContactId];

            // Create a new Opportunity and associate it with the Account and Contact
            Opportunity opp = new Opportunity();
            opp.Name = 'New Opportunity';
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addDays(30);
            opp.AccountId = acct.Id;
            opp.Contact__c = con.Id;
            oppList.add(opp);

            // Update the Account and Contact with the converted Lead's information
            acct.Name = l.Company;
            con.FirstName = l.FirstName;
            con.LastName = l.LastName;
            con.Email = l.Email;
            con.AccountId = acct.Id;
            accountList.add(acct);
            contactList.add(con);
        }
    }

    // Insert the new records
    insert accountList;
    insert contactList;
    insert oppList;
}
