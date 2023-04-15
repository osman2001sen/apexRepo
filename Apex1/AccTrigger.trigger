trigger AccountTrigger on Account (before insert) {
    
	AccountTriggerHandler.changeRating(Trigger.New);
    
}