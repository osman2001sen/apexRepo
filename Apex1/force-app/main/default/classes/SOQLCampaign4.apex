SELECT Id, Name, StartDate, EndDate, Status
FROM Campaign
WHERE Status = 'In Progress'
ORDER BY StartDate ASC
LIMIT 10