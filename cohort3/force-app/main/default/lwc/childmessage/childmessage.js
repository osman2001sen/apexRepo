import { LightningElement } from 'lwc';

export default class Childmessage extends LightningElement {

  dataToSend='standard data';


  clickhandler(){
    console.log('burada event i publish et');

    const sentthistoParent = new CustomEvent("messagechange", 
    {
      detail: this.dataToSend
    }
    
    );

    // Dispatches the event.
    this.dispatchEvent(sentthistoParent);
  }
  
  changehandler(event){
    this.dataToSend=event.target.value;

    // console.log(event);
    // console.log(event.target);
    console.log(this.dataToSend);

  }

}