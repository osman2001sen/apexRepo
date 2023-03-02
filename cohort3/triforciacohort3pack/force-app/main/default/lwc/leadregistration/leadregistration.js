import { LightningElement,api,track } from 'lwc';

import retrieveCourse from '@salesforce/apex/GuestUserController.retrieveCourse';

import retrieveCampaign from '@salesforce/apex/GuestUserController.retrieveCampaign';
import createAd from '@salesforce/apex/GuestUserController.createAd';
import createCampaignMember from '@salesforce/apex/GuestUserController.createCampaignMember';

import createLead from '@salesforce/apex/GuestUserController.createLead';

export default class NewLeadRegistration extends LightningElement {


 // Expose a field to make it available in the template

// SELECT Id, LastName, FirstName, Ad__c, Interested_Path__c, Info_Session_Date_Time__c, Country, PostalCode, State, City, Street, Company, Email, Phone FROM Lead


singleLead ={
  FirstName:'', 
  LastName:'',
  Email:'', 
  Phone:'',  
  Street:'', 
  City:'',  
  State:'', 
  PostalCode:'', 
  Country:'', 
  Interested_Path__c:'', 
 


  Ad__c:'',  
  Company:''
  
}

infoJSDateTime;

inputChangeHandler(event){


  switch(event.target.name) {
    case 'FirstName':
      this.singleLead.FirstName=event.target.value;
      break;
    case 'LastName':
      this.singleLead.LastName=event.target.value;      
      break;
    case 'Email':
      this.singleLead.Email=event.target.value;      
      break;  
    case 'Phone':
      this.singleLead.Phone=event.target.value;     
      break;
    case 'Street':
      this.singleLead.Street=event.target.value;     
      break;

    case 'City':
      this.singleLead.City=event.target.value;      
      break;

    case 'State':
      this.singleLead.State=event.target.value;     
      break;
    case 'PostalCode':
      this.singleLead.PostalCode=event.target.value;      
      break;

    case 'Country':
      this.singleLead.Country=event.target.value;
    break;

    case 'Interested_Path__c':
      this.singleLead.Interested_Path__c=event.target.value;
    break;

    case 'infoJSDateTime':
      this.infoJSDateTime=event.target.value;
    // 2023-03-01T20:26:00.000Z
      break;


        default:
      // code block
      console.log('default...switch case');
  }


  // console.log(this.singleLead);

}

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


https://triforciacohort3pack-dev-ed.develop.my.site.com/s/info-registration?
utm_source=google&
utm_medium=mobile&
utm_campaign=winterSale&
utm_id=11111&
utm_term=aws+kursu&
utm_content=landingPage&
utm_referer=clarusway

*/

@track options = [];
startDate;

 // Flexipage provides recordId and objectApiName
 @api recordId;  // lead ID 
 @api objectApiName='Lead';

@api utm_source;
@api utm_medium;
@api utm_campaign;
@api utm_id;
@api utm_term;
@api utm_content;
@api utm_referer;


campaign;
advertiseId;

 async clickhandler(){
  this.loading=true;

  /** 
   * 
   *  this.isLeadSent=true;
  this.loading=false;


  */


await createLead({
  singleLead:this.singleLead,
infoDate: this.infoJSDateTime
})
.then(leadid=>{
this.recordId=leadid;
console.log('lead created successfully');
})
.catch(err=>{
  console.log('Lead Error : '+ err);
});

let campMember={
  LeadId:this.recordId,
  CampaignId:this.campaign.Id,
  Status:'Sent'

}

await createCampaignMember({
  cm:campMember
})
.then(data=>{
  console.log('campaign member success');
  console.log(data);
})
.catch(err=>{
  console.log('Error : createCampaignMember');
  console.log(err);
});

this.loading=false;
this.isLeadSent=true;

 }

 handleChange(event) {
     this.value = event.detail.value;

     // console.log(JSON.parse(JSON.stringify(event.detail)));

    
     let selectedOption=this.options.filter(option=>option.value==event.detail.value);
     
    console.log(JSON.parse(JSON.stringify(selectedOption)));

     this.companyName=selectedOption[0].label;
     this.startDate = selectedOption[0].StartDate;  // course start date...


     this.singleLead.Company=this.companyName;

     this.singleLead.Interested_Path__c=this.value;  // course id...


 }
 
 async connectedCallback(){


this.utm_source=this.utm_source.replace('%20',' ');
this.utm_medium=this.utm_medium.replace('%20',' ');
this.utm_campaign=this.utm_campaign.replace('%20',' ');
this.utm_id=this.utm_id.replace('%20',' ');
this.utm_term=this.utm_term.replace('%20',' ');
this.utm_content=this.utm_content.replace('%20',' ');
this.utm_referer=this.utm_referer.replace('%20',' ');

  retrieveCourse()
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

  // utm_id

  await retrieveCampaign({
    searchCampaign:this.utm_id
  })
  .then(campaign =>{
    console.log('campaign');

    console.log(JSON.parse(JSON.stringify(campaign)));

    this.campaign=campaign;

    console.log(this.campaign.Id);
    console.log(this.campaign.Name);

    console.log('adRecord objesi oluşturuluyor.....');
  })
  .catch(err=>{
    console.log('retrieveCampaign ERR : ');
    console.log(JSON.parse(JSON.stringify(err)));
  });
 
 // SELECT Id, Name, Campaign__c, UTM_Campaign__c, UTM_Content__c, UTM_Referer__c, UTM_Medium__c, UTM_Source__c, UTM_Term__c FROM Ad__c

// Campaign__c,
// Lead id 


let adRecord={
  UTM_Campaign__c:this.utm_campaign, 
  UTM_Content__c:this.utm_content,
  UTM_Referer__c:this.utm_referer, 
  UTM_Medium__c:this.utm_medium, 
  UTM_Source__c:this.utm_source, 
  UTM_Term__c:this.utm_term,
  Campaign__c:this.campaign.Id
}


console.log('adRecord');
console.log(JSON.stringify(adRecord));

await createAd({
  singleAd:adRecord
})
.then(adId => {
  console.log('AD ID : '+ adId);

  this.advertiseId=adId;



})
.catch(err=>{
  console.log('createAd : err '+ err);
});



this.singleLead.Ad__c=this.advertiseId;


 }   // connected callback end.....

}