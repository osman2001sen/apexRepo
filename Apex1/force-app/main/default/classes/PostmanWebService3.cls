/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-16-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/hello/*')
global class postmanWebService {
    
    @HttpGet							
    global static Account test(String AccountID){
        
        //datatype variableName = Expression
        
       	RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        Account singleAcc = [SELECT Id, Name, Phone, Industry, 
                             (SELECT Id, FirstName, LastName, Email, Phone FROM Contacts),
                             (SELECT Id, Name, Amount, CloseDate, StageName FROM Opportunities)
                             FROM Account WHERE Id=:AccountID LIMIT 1];
        
        res.statusCode=200;
        
        return singleAcc;
        
    }

}