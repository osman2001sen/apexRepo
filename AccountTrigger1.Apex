trigger AccountTrigger on Account (before insert,before update){
    
    List<Account> accList = new List<Account>();
    
    for(Account singleAcc : trigger.new){
        
        singleAcc.Name = singleAcc.Name.toUpperCase();
        if(String.isBlank(singleAcc.CustomerPriority__c )==false){
            singleAcc.Description = 'Account Priority is : '+singleAcc.CustomerPriority__c;
        }
        accList.add(singleAcc);
    }
    
}