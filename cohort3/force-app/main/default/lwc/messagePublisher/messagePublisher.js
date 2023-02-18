import { LightningElement,wire } from 'lwc';

import mc from '@salesforce/messageChannel/mc__c'; // mc.messageChannel-meta.xml
import { publish, MessageContext } from 'lightning/messageService';

export default class MessagePublisher extends LightningElement {

  datatopublish='HELLO MY Subscribers';

  @wire(MessageContext)
  messageContext;

  publishmessageHandler(event){

    event.preventDefault();

    const payload = { recordId: this.datatopublish };

    publish(this.messageContext, mc, payload);

  }

}