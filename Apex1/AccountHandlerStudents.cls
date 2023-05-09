public class AccountHandler {
    
    public static void addStudenttoCohort(String CohortName, List<Contact> multiContact){
        
        Account singleAccount = New Account();
        singleAccount.Name=CohortName;
        insert singleAccount;
        
        for(Contact loopcontact:multiContact){
            loopcontact.AccountId=singleAccount.Id;
        }
        
        upsert multiContact;
        
    }

}