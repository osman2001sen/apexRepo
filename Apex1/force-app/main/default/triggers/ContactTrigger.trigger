trigger ContactTrigger on Contact (before insert) { //contact phone = null > update (contact oluşmadan önce)

    Set<Id> accountIds = New Set<Id>();
    
    for(Contact singleContact:Trigger.New){
        
        if(String.isBlank(singleContact.phone)){
            accountIds.add(singleContact.accountId);
        }
    }
    
    Map <Id, Account> MapAcc = New Map<Id, Account>([SELECT Id, Name, Phone FROM Account WHERE Id=:accountIds]);
    
    for(Contact singleContact:Trigger.New){
        
        if(String.isBlank(singleContact.phone)){
            
            singleContact.OtherPhone = MapAcc.get(singleContact.AccountId).phone;
        }
    }
}       // Trigger'ı bu şekilde yazıp kaydedince, otomatik çalışmaya başlıyor. 
		// Buna Test Apex Class yazıp, tekli ve çoklu contact oluşturunca, trigger çalışıyor mu diye test etmek gerekiyor. 
		// Contact Other Phone'a, Account Phone yazarak mı oluşturuyor Contact'ı.