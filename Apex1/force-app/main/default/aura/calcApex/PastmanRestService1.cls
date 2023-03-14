/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-14-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/hello/*')    
global class postmanWebService {
            
    @HttpGet							
    global static String test(){
        
        return 'Hello Apex GET';
        
    }
    
    @HttpPost							
    global static String test2(){
        
        return 'Hello Apex POST';
        
    }

}