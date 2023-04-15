/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-15-2023
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
}