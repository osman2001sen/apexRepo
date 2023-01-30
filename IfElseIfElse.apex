Integer x=10;
Integer y=20;

if(x<y){                                         
    System.debug('True: x is smaller than y');
    if(x==15){
        System.debug('x is 15');
    } else{
        System.debug('x is not 15');
    }                              
} else if(y==20){
    System.debug('True: y is 20');
} else if(x==y){
    System.debug('True: x is equal to y');
} else if(x>y){
    System.debug('True: x is bigger than y');
} else if(x==10){
    System.debug('True: x is 10');
} else{
    System.debug('False: Other');
}                                 