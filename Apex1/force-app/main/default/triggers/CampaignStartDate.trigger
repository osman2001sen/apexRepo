trigger CampaignStartDate on Campaign (before update) {
    
    switch on Trigger.OperationType {

                                     when BEFORE_UPDATE {
                                         
                                         campaignHandler.beforeUpdate(Trigger.New,Trigger.old,Trigger.NewMap,Trigger.OldMap); 
                                         
                                     }

}
}