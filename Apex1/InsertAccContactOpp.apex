Account CW = New Account();
CW.Name='Apex CW';
insert CW;

List<Contact> multiContact = New List<Contact>();
List<Opportunity> multiOp = New List<Opportunity>();

for (Integer num=1; num<=3;num++){
    Contact singleContact = New Contact();
    singleContact.FirstName='APEX '+num;
    singleContact.LastName='CW Worker '+num;
    singleContact.accountId=CW.Id;
    multiContact.add(singleContact);
    
    Opportunity singleOpportunity=New Opportunity();
    singleOpportunity.Name = CW.Name + ' New Opportunity' + num;
    singleOpportunity.CloseDate = Date.Today() + 30;
    singleOpportunity.StageName = 'Prospecting';
    singleOpportunity.accountid = CW.id;
    multiOp.add(singleOpportunity);
}

insert multiContact;
insert multiOp;