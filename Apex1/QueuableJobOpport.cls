/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-19-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public class UpdateOpportunityStatusJob implements Queueable {
    private Opportunity opportunity;

    public UpdateOpportunityStatusJob(Opportunity opp) {
        this.opportunity = opp;
    }

    public void execute(QueueableContext context) {
        
        opportunity.StageName = 'Closed Won';
        opportunity.CloseDate = Date.today();
        
        update opportunity;
        
    }
}
