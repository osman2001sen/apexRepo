FIND {last} IN ALL FIELDS RETURNING Campaign (Id, Name, Status, StartDate, EndDate)
WHERE Status = 'Active' AND StartDate < TODAY
