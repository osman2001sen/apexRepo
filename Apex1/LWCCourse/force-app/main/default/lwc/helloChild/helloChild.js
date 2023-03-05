import { LightningElement,track } from 'lwc';

export default class HelloChild extends LightningElement {

    constructor(){
        super();
        console.log('HelloChild Constructor');
    }

    connectedCallback(){
        console.log('HelloChild connectedCallback');
    }

    renderedCallback(){
        console.log('HelloChild renderedCallback');
    }

    disconnectedCallback(){
        console.log('HelloChild disconnectedCallback');
    }

}