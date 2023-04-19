/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-19-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountTriggerHandler {
    
    public static void changeRating(List<Account> accList){
        for(Account acc:accList){
            if(acc.Industry == 'Manufacturing' || acc.Industry == 'Retail'){
                acc.Rating = 'Hot';
            }
        }
    }
    
    
    public static void createRelatedOpportunity(List<Account> accList) {
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc:accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = System.today() + 30;
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    
    public static void updateAccountDesc(List<Account> accList, Map<Id, Account> oldAccountMap){
        for(Account acc:accList){
            if(acc.Phone != oldAccountMap.get(acc.Id).Phone){
                acc.Description = 'The Account’s phone is updated. The old number was: ' +  oldAccountMap.get(acc.Id).Phone + '. The new phone number is: ' + acc.Phone + '.';
            }
        }
    }
}