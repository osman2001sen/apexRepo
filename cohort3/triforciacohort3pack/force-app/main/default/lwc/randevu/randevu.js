import { LightningElement,api } from 'lwc';

export default class Randevu extends LightningElement {

  @api calendlyLink; 
  @api leadId; 
  @api leadName; 
  @api leadEmail; 

  // https://triforciaprojectpackage-dev-ed.develop.my.site.com/s/randevu?calendlyLink={!get_user.Calendly__c}&amp;leadId=${!getLead.Id}&amp;leadName={!getLead.Name}&amp;leadEmail={!getLead.Email}
  
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