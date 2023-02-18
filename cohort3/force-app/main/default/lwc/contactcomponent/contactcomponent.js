import { LightningElement,api } from 'lwc';


import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import PHONE from '@salesforce/schema/Contact.Phone';
import EMAIL from '@salesforce/schema/Contact.Email';


export default class Contactcomponent extends LightningElement {
  
  fields = [FIRSTNAME,LASTNAME,PHONE,EMAIL];
  firstname=FIRSTNAME;
  lastname=LASTNAME;
  phone=PHONE;
  email=EMAIL;

  @api recordId;
  @api objectApiName;

  connectedCallback(){
    console.log('FIELDS :');
    console.log(JSON.parse(JSON.stringify(this.fields)));

    console.log('Record ID : '+ this.recordId);
    console.log('objectApiName '+ this.objectApiName);
    
  }

}