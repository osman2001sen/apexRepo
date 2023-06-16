/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-15-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/hello/*')
global class postmanWebService {
    
    @HttpPost							
    global static String test(String message){
        
        //datatype variableName = Expression
        
       	RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        return req.toString();
        
    }

}   @HttpPost							
    global static String test(String message){
        
        //datatype variableName = Expression
        
       	RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        return req.toString();
        
    }

}