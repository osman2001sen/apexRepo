import { LightningElement } from 'lwc';

export default class Leadregistration extends LightningElement {


singleLead={
  FirstName:'',
  LastName:'',
  Phone:'',
  Email:'',
  Country:'',
  Info_Session_Date_Time__c:null
};
//  Interested_Path__c, Info_Session_Date_Time__c, LastName, FirstName, Country, Email, Phone


inputChangeHandler(event){

  console.log(event.target.name);
  console.log(event.target.value);

  
  switch(event.target.name) {
    case 'FirstName':
      this.singleLead.FirstName=event.target.value;
      break;
    case 'LastName':
      this.singleLead.LastName=event.target.value;
      break;
    case 'Phone':
      this.singleLead.Phone=event.target.value;
      break;
    case 'Email':
      this.singleLead.Email=event.target.value;
      break;
    case 'Country':
      this.singleLead.Country=event.target.value;
      break;
    case 'Info_Session_Date_Time__c':
      this.singleLead.Info_Session_Date_Time__c=event.target.value;
      break;
  
    default:
      // code block
      console.log('default....');
  }

  console.log(JSON.parse(JSON.stringify(this.singleLead)));


}


}