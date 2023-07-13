SELECT Id, Name, Type, Phone, Industry, AnnualRevenue,                                  
(SELECT Id, Name, Phone, Email, Title, Department FROM Contacts), 
(SELECT Id, Name, Amount, CloseDate, StageName, IsWon FROM Opportunities) 
FROM Account