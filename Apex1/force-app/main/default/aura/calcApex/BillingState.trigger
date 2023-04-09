/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-09-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger SetBillingState on Account (before insert) {
  for (Account acc : Trigger.new) {
    if (acc.BillingCountry == 'USA') {
      acc.BillingState = 'CA';
    }
  }
}
