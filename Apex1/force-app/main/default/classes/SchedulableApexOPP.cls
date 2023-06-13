/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-12-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class OpportunityScheduler implements Schedulable {
    
    public void execute(SchedulableContext context) {
        
        List<Opportunity> openOpportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE IsClosed = false];
        
        for (Opportunity opp : openOpportunities) {
            if (opp.StageName != 'Closed Won') {
                opp.StageName = 'Closed Lost';
            }
        }
        
        update openOpportunities;
        
        System.debug('Opportunity Scheduler executed at: ' + DateTime.now());
    }
    
}
