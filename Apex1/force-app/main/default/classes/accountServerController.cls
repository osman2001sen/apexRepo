public class accountServerController {
    
    @auraEnabled
    public static String create(Account singleAcc){
        
        try{
            insert singleAcc; 
        } catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
         
        
		return singleAcc.id;        
    }
    
    
    @auraEnabled
    public static List<Account> retrieveacc(){
        
        List<Account> multiacc = New List<Account>();
        
        try{
            multiacc= [SELECT Id, Name, Phone,Website, Industry FROM Account ORDER BY Createddate DESC LIMIT 10];
        } catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
         
        
		return multiacc;        
    }
    
    
    

}