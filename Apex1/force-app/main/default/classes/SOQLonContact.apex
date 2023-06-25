SELECT Id, FirstName, LastName, Email, Phone, Account.Name
FROM Contact
WHERE Account.Industry = 'Technology'
