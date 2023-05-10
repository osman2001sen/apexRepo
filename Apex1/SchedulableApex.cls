/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-09-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class SendMonthlyReport implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        List<Contact> contacts = [SELECT Id, Email FROM Contact WHERE Mailing_List_Opt_In__c = true];
        List<String> emailAddresses = new List<String>();
        for (Contact c : contacts) {
            emailAddresses.add(c.Email);
        }
        if (emailAddresses.size() > 0) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(emailAddresses);
            mail.setSubject('Monthly Newsletter');
            mail.setHtmlBody('Dear valued customers,<br/><br/>Here is your monthly newsletter with updates about our products and services.<br/><br/>Thank you for your continued business!<br/><br/>Best regards,<br/>The Sales Team');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
}
