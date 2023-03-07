import { LightningElement, api, wire } from 'lwc';
import getAccounts from '@salesforce/apex/LWCAccountsController.getAccounts';
import {publish, MessageContext} from 'lightning/messageService';
import viewAccountContactsChannel from '@salesforce/messageChannel/viewAccountContactsChannel__c';

const COLUMNS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name'},
    { label: 'Actions', type:'button', typeAttributes:{
        label:'View Contacts',
        name: 'View Contacts',
        title: 'View Contacts',
        value: 'View Contacts',
    }},
];

export default class AccountSearchResult extends LightningElement {
    @api searchText
    columns=COLUMNS;
    @wire(getAccounts, {searchText:'$searchText'})
    accountsList;

    @wire(MessageContext)
    MessageContext;

    //Respond to UI event by publishing message
    rowActionHandler(event){
        if(event.detail.action.value=='View_Contacts'){
            const payload = {accountId: event.detail.row.Id, accountName: event.detail.row.name}; 
            publish(this.MessageContext, viewAccountContactsChannel, payload);
        }
    }

}