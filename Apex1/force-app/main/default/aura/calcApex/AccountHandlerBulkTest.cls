/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountHandlerTest {
    
    @isTest
    public static void createTest1(){                    //Bulk TEST
        List<Account> multiAcc = New List<Account>();
        
        for(Integer x=1; x<=200; x++){
            Account singleAcc=New Account();
            singleAcc.Name='TEST Acc '+x;
            
            multiAcc.add(singleAcc);
        }
        
        AccountHandler.createUpperCase(multiAcc);
        
        List<Account> testAcc= [SELECT Id, Name FROM Account];
        
        System.assertEquals(200, testAcc.size());
        
    }
}