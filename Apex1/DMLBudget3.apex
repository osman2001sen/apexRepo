List<Budget__c> multiBudget = [SELECT Id FROM Budget__c WHERE Name LIKE '%2022%'];

delete multiBudget;