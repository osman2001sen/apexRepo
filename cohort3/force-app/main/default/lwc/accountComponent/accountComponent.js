import { LightningElement,wire,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


// import apex class method. 
import retrive from '@salesforce/apex/accountLWCController.retrive';

const columns = [
  { label: 'Company Name', fieldName: 'Name' },
  { label: 'Website', fieldName: 'Website', type: 'url' },
  { label: 'Phone', fieldName: 'Phone', type: 'phone' },
  { label: 'Industry', fieldName: 'Industry' },
 
];


export default class AccountComponent extends LightningElement {
  // properties
  @track multiaccounts;
  searchText;
  columns=columns;

  // wire 
 // @wire(retrive,{searchterm:'$searchText'}) accounts;  // accounts.data

renderedCallback(){
  console.log(this.accounts);
}

textChangeHandler(event){
  this.searchText=event.target.value;
  console.log(this.searchText);


  // imperative
  retrive({
    searchterm:this.searchText
  })
  .then(data=>{

    console.log('retrieved Accounts');
    console.log(data);
  this.multiaccounts=data;

  // succesful apex method return
        const succevt = new ShowToastEvent({
          title: 'Success ',
          message: 'Succesfully Searched' ,
          variant: 'success',
          mode: 'dismissable'
      });

      this.dispatchEvent(succevt);


  })
  .catch(err=>{
    console.log(err);
    
// error on  apex method return
    const errorevt = new ShowToastEvent({
          title: 'Error ',
          message: err ,
          variant: 'error',
          mode: 'dismissable'
      });

      this.dispatchEvent(errorevt);


  });

}

connectedCallback(){

console.log('connected callback is running');

}

}