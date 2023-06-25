SELECT Id, Name, StageName, CloseDate, Amount, Account.Name
FROM Opportunity
WHERE StageName = 'Closed Won'
