/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-26-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class UpdateOpportunityStage {

// Method to update Opportunity Stage based on Amount
public static void updateOpportunityStage(List<Opportunity> oppList) {
    List<Opportunity> updateList = new List<Opportunity>();

    for (Opportunity opp : oppList) {
        // Check if Amount is greater than $10,000
        if (opp.Amount > 10000) {
            // Set Stage to "Closed Won"
            opp.StageName = 'Closed Won';
            updateList.add(opp);
        } else {
            // Set Stage to "Prospecting"
            opp.StageName = 'Prospecting';
            updateList.add(opp);
        }
    }

    // Update the Opportunities in the database
    if (!updateList.isEmpty()) {
        try {
            update updateList;
        } catch (DmlException e) {
            // Handle any exceptions here (e.g., log error messages)
            System.debug('Error updating Opportunities: ' + e.getMessage());
        }
    }
}
}
