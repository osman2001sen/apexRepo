public class campaignHandler {
    
    public static void beforeUpdate(List<Campaign> triggerNew, List<Campaign> triggerOld,Map<Id,Campaign> TriggerNewMap, Map<Id,Campaign> TriggerOldMap){
         
         for(Campaign singleCampaign:triggerNew){
             
             if(singleCampaign.StartDate != TriggerOldMap.get(singleCampaign.id).StartDate){
                 singleCampaign.StartDate.addError('You cannot change a campaign start date, please contact your admin!');
             }
             
         }
         
         
     }    

}