sObject CWsObject = [SELECT Id, Name FROM Account WHERE Name = 'Apex CW'];

System.debug(CWsObject);
System.debug(CWsObject.get('Name')); 