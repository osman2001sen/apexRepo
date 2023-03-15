/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-15-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/hello/*')
global class postmanWebService {
    
    @HttpPost							
    global static String test(String message){
        
        return 'Hello Apex Post ==>'+message;
        
    }

}
