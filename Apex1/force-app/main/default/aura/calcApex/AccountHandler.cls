/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHandler {
    
    public static void create(String name){
        
        Account singleAcc=New Account();
        
        singleAcc.name=name;
        
        insert singleAcc;
    }

}