import { LightningElement } from 'lwc';

export default class Parentmessage extends LightningElement {

  childmessage;
  messageReceivedfromChild(event){
    console.log('message received from child....');
    console.log(event.detail);
    this.childmessage=event.detail;
  }
}