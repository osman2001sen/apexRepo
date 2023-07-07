SELECT Id, Name, StartDate, EndDate, Status
FROM Campaign
WHERE Type = 'Email' AND IsActive = TRUE
ORDER BY StartDate DESC
LIMIT 10
