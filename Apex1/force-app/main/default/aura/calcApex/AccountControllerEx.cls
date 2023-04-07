/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-07-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountController {
    public List<Account> getAccounts() {
        List<Account> accounts = [SELECT Id, Name, Industry, Rating FROM Account];
        return accounts;
    }
    
    public void createAccount(Account account) {
        insert account;
    }
    
    public void updateAccount(Account account) {
        update account;
    }
    
    public void deleteAccount(Account account) {
        delete account;
    }
}
