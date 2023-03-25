import { LightningElement,api } from 'lwc';

export default class Randevu extends LightningElement {

  @api calendlyLink; 
  @api leadId; 
  @api leadName; 
  @api leadEmail; 

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