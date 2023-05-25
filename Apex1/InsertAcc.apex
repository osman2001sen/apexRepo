Account singleAcc = New Account();
singleAcc.Name = 'Apex - Triforcia';

insert singleAcc;

Opportunity singleOp = New Opportunity();

singleOp.Name = 'Apex - Triforcia New Opportunity';
singleOp.StageName = 'Needs Analysis'; 
singleOp.CloseDate = date.today()+15; // date

singleOp.AccountId =singleAcc.id;   // 'Apex - Triforcia' company id 

singleOp.Amount = 30000;

insert singleOp;