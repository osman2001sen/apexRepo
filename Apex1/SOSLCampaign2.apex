FIND {Initial} IN ALL FIELDS RETURNING Campaign (Id, Name, Type, Status, StartDate, EndDate)
WHERE Type = 'Webinar' AND Status = 'Planned' AND StartDate > TODAY
