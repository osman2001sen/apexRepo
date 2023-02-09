trigger AvoidDeleteAccWtCont on Account (before delete) {
    
    if (Trigger.isBefore && Trigger.isDelete) {
      List<Contact> relatedContacts = [SELECT AccountId FROM Contact WHERE AccountId IN:Trigger.OldMap.keySet()];

      Set<Id> accountIds = new Set<Id>();
      for (Contact cont : relatedContacts) {
          accountIds.add(cont.accountId);
      }

      for (Account acc : trigger.old) {
         if (accountIds.contains(acc.Id)) {
             acc.addError('You cannot delete this account because it has at least one related contact!');
         }
      }    
   }

}