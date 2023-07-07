SELECT Id, Name, Type, StartDate, EndDate, Status, NumberOfLeads
FROM Campaign
WHERE Status = 'In Progress' AND NumberOfLeads > 100
ORDER BY StartDate ASC
