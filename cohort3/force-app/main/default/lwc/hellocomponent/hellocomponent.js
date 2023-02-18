import { LightningElement, track} from 'lwc';

export default class Hellocomponent extends LightningElement {

    @track cardText = {
        title:'Track Decorator Example',
        body:'Card Body Track Decorator',
        footer:'Card Footer Example'
    }

    titleChangeHandler(){
        this.cardText.title='Button Clicked';
        this.cardText.body='Button Clicked';
        this.cardText.footer='Button Clicked';

        console.log(JSON.stringify(this.cardText));
    }
}