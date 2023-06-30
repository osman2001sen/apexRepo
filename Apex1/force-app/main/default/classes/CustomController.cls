/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-29-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CalculateOpportunity {

public String accid{get;set;}
public List<Opportunity> multiop {get; set;}

//constructor method
public CalculateOpportunity(ApexPages.StandardController controller) {
    accid = ApexPages.currentPage().getParameters().get('id');
    
    multiop = New List<Opportunity>();
    multiop = [SELECT Id, Name, Amount, CloseDate, StageName FROM Opportunity WHERE accountid=:accid];
}

}