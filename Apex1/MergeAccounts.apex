Account triforcia = [SELECT Id, Name FROM Account
                   	 WHERE Name='apex - clarusway__upsertupserted'];

Account CW = [SELECT Id, Name FROM Account
              WHERE Name='Apex CW'];

merge CW triforcia;   