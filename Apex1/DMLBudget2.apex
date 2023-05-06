List<Expense__c> multiExpense = [SELECT Id, Name, Budget__r.Name, Value__c 
                                 FROM Expense__c WHERE Budget__r.Name LIKE '%2022%'];

for(Expense__c ex:multiExpense){
    ex.Value__c=2500;
}

Update multiExpense;