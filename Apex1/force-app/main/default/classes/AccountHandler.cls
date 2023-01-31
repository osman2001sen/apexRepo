public with sharing class AccountHandler {
    
    public static Boolean addStudenttoCohort(String CohortName,List<Contact> multiContact ){
        
        
        if(CohortName==null || CohortName==''){
            return false;
        }
        
         for(Contact loopcontact:multiContact){
             
             
        
            if(loopcontact.lastName==null || loopcontact.lastName==''){
                return false;
            }
             
         }
        
        Account singleAccount = New Account();
        
        singleAccount.Name=CohortName; 
        
        // Account ( OLS )    FLS Account.Name 
        
        if(Schema.sObjectType.Account.fields.Name.isCreateable()){  // true OK- False No auth.
        
        	insert singleAccount;
            
            
        } else {
            
            return false;   // NO AUTH to Account Name Field.
        }    
        
        
        for(Contact loopcontact:multiContact){
            loopcontact.AccountId=singleAccount.id;
              
        }
        
        
        // OLS Contact -   FLS firstName LastName Email Phone  AccountId
        
        Integer flsPoint = 0;
        
        if(Schema.sObjectType.Contact.fields.firstName.isCreateable() && Schema.sObjectType.Contact.fields.firstName.isUpdateable()){
            flsPoint++;
        if(Schema.sObjectType.Contact.fields.lastName.isCreateable() && Schema.sObjectType.Contact.fields.lastName.isUpdateable()){
            flsPoint++;
 		if(Schema.sObjectType.Contact.fields.email.isCreateable() && Schema.sObjectType.Contact.fields.email.isUpdateable()){
            flsPoint++;
        if(Schema.sObjectType.Contact.fields.phone.isCreateable() && Schema.sObjectType.Contact.fields.phone.isUpdateable()){
            flsPoint++;
         }}}} 
        
        
        if(flsPoint==4){
          upsert multiContact;  
        } else {
            return false;    /// Custom : Min Access Acc Cont    profile > contact fields (phone, email)
        }
        
         
		return true;        
    }
    
    
    //***Aşağısı başka bir method.
    
    public static void createUpperCase(List<Account> multiAcc){ // bulkification
        
       //  Contact manager = [SELECT Id, Name FROM Contact WHERE Name LIKE '%manager%' WITH SECURITY_ENFORCED];
        
        for(Account acc:multiAcc){
            acc.name=acc.name.toUpperCase();
        }
        
        
         if(Schema.sObjectType.Account.fields.Name.isCreateable()){  // true OK- False No auth.
        
        	insert multiAcc;   // FLS Check......
             
         }     
        
    }
 
    
}