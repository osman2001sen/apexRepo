import { LightningElement,api,track } from 'lwc';

import NAME from '@salesforce/schema/Lead.Name';
import EMAIL from '@salesforce/schema/Lead.Email';
import PHONE from '@salesforce/schema/Lead.Phone';
import ADDRESS from '@salesforce/schema/Lead.Address';
import COMPANY from '@salesforce/schema/Lead.Company';
import INFO from '@salesforce/schema/Lead.Info_Session_Date_Time__c';
import INTERESTED from '@salesforce/schema/Lead.Interested_Path__c';


import retrieve from '@salesforce/apex/UIcourseController.retrieve';


export default class NewLeadRegistration extends LightningElement {


 // Expose a field to make it available in the template
 fields = [
NAME,
EMAIL,
PHONE,
ADDRESS,
COMPANY,
INFO,
INTERESTED
 ];


 name=NAME;
 email=EMAIL;
 phone=PHONE;
 address=ADDRESS;
 company=COMPANY;
 info=INFO;
 interested=INTERESTED;

isLeadSent=false;

loading=false;

value = 'inProgress';
companyName='xx';

/*
options = [
  { label: 'New', value: 'new' },
  { label: 'In Progress', value: 'inProgress' },
  { label: 'Finished', value: 'finished' },
];


*/

@track options = [];
startDate;


 // Flexipage provides recordId and objectApiName
 @api recordId;
 @api objectApiName='Lead';



 clickhandler(){
  this.loading=true;

setTimeout(() => {
  this.isLeadSent=true;
  this.loading=false;
}, 3000);
 }


handleChange(event) {
     this.value = event.detail.value;

     // console.log(JSON.parse(JSON.stringify(event.detail)));

    
     let selectedOption=this.options.filter(option=>option.value==event.detail.value);
     
    console.log(JSON.parse(JSON.stringify(selectedOption)));

     this.companyName=selectedOption[0].label;
     this.startDate = selectedOption[0].StartDate;

 }

connectedCallback(){
  retrieve()
  .then(multicourse=>{

    multicourse.forEach(course => {
      
      this.options=[
        ...this.options,

        { 
          label: course.Name, 
          value: course.Id,
          StartDate:course.Start__c
      
        }
      ];


    });

  })
  .catch(err=>{
    console.log(err);
  });

 }
}