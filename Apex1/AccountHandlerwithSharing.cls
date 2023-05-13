/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-13-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountHandler {        //Sharing rules'a uy! Bitti. Bu kadar kolay. Başkalarının data'sı olayını çözdük.
    
    public static Boolean addStudenttoCohort(String CohortName,List<Contact> multiContact ){
        
        
        if(CohortName==null || CohortName==''){          //Zorunlu alan check'leri başa koyduk. Zorunlu alanlar eksik gelirse, account da contact da oluşmayacak.
            return false;
        }
        
         for(Contact loopcontact:multiContact){
             
             
        
            if(loopcontact.lastName==null || loopcontact.lastName==''){
                return false;
            }
             
         }
        
        
        Account singleAccount = New Account();
        
        singleAccount.Name=CohortName; 
        
        // Account ( OLS )    FLS Account.Name //Bunlar kontrol edilmeli. Ona göre insert yapılmalı. Field yapsak, obj'i de hallediyor burada.
        
        if(Schema.sObjectType.Account.fields.Name.isCreateable()){  //True ise yetki var. Insert.
        
        	insert singleAccount;
            
            
        } else {
            
            return false;   // NO AUTH to Account Name Field. No Authority to Create Contact.
        }    
        
        
        for(Contact loopcontact:multiContact){
            loopcontact.AccountId=singleAccount.id;
              
        }
        
        
        // Contact OLS - FLS FirstName LastName Email Phone //Bunlar kontrol edilmeli. Ona göre upsert yapılmalı.
        
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
    
    
    
    
    
    
    public static void createUpperCase(List<Account> multiAcc){ // bulkification //bu hariç USER MODE'a uygun.
        
       //  Contact manager = [SELECT Id, Name FROM Contact WHERE Name LIKE '%manager%' WITH SECURITY_ENFORCED];
        
        for(Account acc:multiAcc){
            acc.name=acc.name.toUpperCase();
        }
        
        insert multiAcc;  
        
    }
    
    
    
}