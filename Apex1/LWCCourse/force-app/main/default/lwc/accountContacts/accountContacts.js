import { LightningElement, wire } from 'lwc';
import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';
import viewAccountContactsChannel from '@salesforce/messageChannel/viewAccountContactsChannel__c';
import getAccountContacts from '@salesforce/apex/LWCAccountsController.getAccountContacts';
export default class AccountContacts extends LightningElement {
    subscription=null;
    accountID='';
    @wire(MessageContext)
    messageContext;
    contacts=[];
    title='Contacts';

    connectedCallback(){
        this.subscribeToMessageChannel();
    }

    get isAccountSelected(){
        return this.accountId?true:false;
    }

    get hasContacts(){
        return this.Contacts?.length>0;
    }    

    async getContacts(){
        const data= await getAccountContacts({accoundId:this.accountId});
        this.contacts=data;
    }

    // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                viewAccountContactsChannel,
                (data) => this.handleAccountSelection(data),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    handleAccountSelection(data){
        this.accountId=data.accountId;
        this.title=`${data.accountName}'s Contacts`;
        this.getContacts();
    }

    disconnectedCallback(){
        this.unsubscribeToMessageChannel();
    }

    unsubscribeToMessageChannel() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }
}