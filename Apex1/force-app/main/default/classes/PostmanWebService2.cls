/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/hello/*')
global class postmanWebService {
    
    @HttpPost							
    global static void test(){
        
        //datatype variableName = Expression
        
       	RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        res.statusCode=200;
        
        res.responseBody=Blob.valueOf('{"selam":"hello"}');
        
    }

}