/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHandler {      
    
    public static void createUpperCase(List<Account> multiAcc){          
        
        for(Account acc:multiAcc){
            acc.name=acc.name.toUpperCase();
        }
        
        insert multiAcc;
        
    }

}