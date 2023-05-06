List<Budget__c> multiBudget = New List<Budget__c>();

List<String> aylar = New List<String>{
    'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül',
    'Ekim', 'Kasım', 'Aralık'
};

for(Integer x=0; x<=11; x++){
    Budget__c singleBudget = New Budget__c();
    singleBudget.name=aylar.get(x)+' 2022';  
    
    multiBudget.add(singleBudget);
    //System.debug(singleBudget);
}

//System.debug(multiBudget);

insert multiBudget; 

List<Income__c> multiIncome= New List<Income__c>();
List<Expense__c> multiExpense= New List<Expense__c>();
    

for(Budget__c loopBudget:multiBudget){
    Income__c singleIncome=New Income__c();
    Expense__c singleExpense=New Expense__c();
    
    singleIncome.Budget__c=loopBudget.Id; 
    singleIncome.Value__c=3000;
    singleIncome.Income_Source__c='Wage';
    
    multiIncome.add(singleIncome);
    System.debug(singleIncome);
    
    singleExpense.Budget__c=loopBudget.Id;
    singleExpense.Value__c=2000;
    singleExpense.Expense_Source__c='Credit Card';
    
    multiExpense.add(singleExpense);
    System.debug(singleExpense);
    
}

insert multiIncome;
insert multiExpense;