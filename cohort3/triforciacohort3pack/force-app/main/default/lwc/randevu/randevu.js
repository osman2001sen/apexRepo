import { LightningElement,api } from 'lwc';

export default class Randevu extends LightningElement {

  @api calendlyLink; 
  @api leadId; 
  @api leadName; 
  @api leadEmail; 

  // https://triforciaprojectpackage-dev-ed.develop.my.site.com/s/randevu?calendlyLink={!get_user.Calendly__c}&amp;leadId=${!getLead.Id}&amp;leadName={!getLead.Name}&amp;leadEmail={!getLead.Email}
  
  // Calendly token: eyJraWQiOiIxY2UxZTEzNjE3ZGNmNzY2YjNjZWJjY2Y4ZGM1YmFmYThhNjVlNjg0MDIzZjdjMzJiZTgzNDliMjM4MDEzNWI0IiwidHlwIjoiUEFUIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJodHRwczovL2F1dGguY2FsZW5kbHkuY29tIiwiaWF0IjoxNjc4NzM3OTU1LCJqdGkiOiI1MTE0Y2UwMy00YzcyLTRkMmYtODAyZC1mMmU0MmQxMDZhY2MiLCJ1c2VyX3V1aWQiOiIwMWNjOGNiZS1iMTYwLTRmNDMtOTFiMC02NDc1MjFhMWM4NzQifQ.9bldT7Ap7J-hccL2aAy1jgrLGQarsmEZbkbGhwzJdKLwYF_jQH2gr4fmMgKIb5z6_4rrgu9lfub1oze_I9-C0Q
  // Calendly current organization: https://api.calendly.com/organizations/5a80c6c2-6761-4cf6-a806-f69be846ca07
  connectedCallback(){
    console.log('this.calendlyLink');
 
    console.log(this.calendlyLink);


    this.calendlyLink=this.calendlyLink.replaceAll('%2F','/').replaceAll('%3A',':');

    // ? name= 
    // & email= 
    let name='?name='+this.leadId+' '+this.leadName;
    let email='&email='+this.leadEmail;

    this.calendlyLink+=name+email;
    
    console.log(this.calendlyLink);
  }

}