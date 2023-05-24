FIND {Smith} IN ALL FIELDS RETURNING Contact (Id, FirstName, LastName, Email, Phone, MailingStreet, MailingCity, MailingState)
WHERE MailingState = 'Florida' AND Email != null
