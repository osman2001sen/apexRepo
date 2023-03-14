trigger LeadStatusChange on Lead (Before Update) {

    for(Lead l : Trigger.new){
    
        if(l.Email !=null && l.Status == 'Working - Contacted' && l.FirstName !=null && l.LastName !=null){
        
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            String email = UserInfo.getUserEmail();
            List<String> emailList = new List<String>{email,l.Email};
            msg.setToAddresses(emailList);
            msg.setPlainTextBody('Hello '+ l.FirstName + ' your status has been updated as Working-Contacted.');
            msg.setSubject('Lead Status Change');
            Messaging.Email [] emails = new Messaging.Email []{msg};
            Messaging.sendEmail(emails);
        }
    }
}