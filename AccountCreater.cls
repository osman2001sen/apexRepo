public class AccountCreater {

    public static void createAcc(String accName, Integer accAnnualRevenue){

        Account acc = new Account();
        acc.Name = accName;
        acc.AnnualRevenue = accAnnualRevenue;
        
        insert acc;
    }

    public static String accPriority(String accName){
        
        Account singleAcc = [SELECT name, Id, CustomerPriority__c, AnnualRevenue 
                            FROM Account 
                            WHERE name =:accName LIMIT 1];  

        if(singleAcc.AnnualRevenue >= 1000000){
            singleAcc.CustomerPriority__c = 'High';
        }else if(singleAcc.AnnualRevenue >= 500000){
            singleAcc.CustomerPriority__c = 'Medium';
        }else{
            singleAcc.CustomerPriority__c = 'Low';
        }

        update singleAcc;

        return singleAcc.CustomerPriority__c;
    }  
}