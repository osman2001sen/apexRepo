public class OpportunityExtension {
    private Opportunity opp { get; set; }
    public Boolean displayStageMessage { get; set; }

    public OpportunityExtension(ApexPages.StandardController controller) {
        opp = (Opportunity)controller.getRecord();
        displayStageMessage = false;
    }

    public void updateStage() {
        
        opp.StageName = 'Closed Won';

        try {
            update opp;
            displayStageMessage = true;
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'An error occurred while updating the opportunity stage.'));
        }
    }
}
