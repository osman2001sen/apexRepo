import { LightningElement,api } from 'lwc';

export default class Randevu extends LightningElement {

  @api calendlyLink; 

  // https://triforciaprojectpackage-dev-ed.develop.my.site.com/s/randevu?calendlyLink=https%3A%2F%2Fcalendly.com%2Fosman2001sen%2Fcw-demo-randevu

  connectedCallback(){
    console.log('this.calendlyLink');
 
    console.log(this.calendlyLink);


    this.calendlyLink=this.calendlyLink.replaceAll('%2F','/').replaceAll('%3A',':');

    console.log(this.calendlyLink);
  }

}