/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-13-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
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
        
        if(Schema.sObjectType.Account.fields.Name.isCreateable()){ 
        
        	insert singleAccount;
            
            
        } else {
            
            return false;   
        }    
        
        for(Contact loopcontact:multiContact){
            loopcontact.AccountId=singleAccount.id;
              
        }
        
        
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
          return false;
        }
        
         
		return true;        
    }
    
    public static void createUpperCase(List<Account> multiAcc){
        
        for(Account acc:multiAcc){
            acc.name=acc.name.toUpperCase();
        }
        
        insert multiAcc;  
        
    }   
}