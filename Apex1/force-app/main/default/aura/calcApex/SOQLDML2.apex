List<Budget__c> multiBudget = New List<Budget__c>();

List<String> aylar = New List<String>{
    'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül',
    'Ekim', 'Kasım', 'Aralık'
};

for(Integer x=0; x<=11; x++){
    Budget__c singleBudget = New Budget__c();
    singleBudget.name=aylar.get(x)+' 2022';
    
    multiBudget.add(singleBudget);
    System.debug(singleBudget);
}

System.debug(multiBudget);

insert multiBudget;