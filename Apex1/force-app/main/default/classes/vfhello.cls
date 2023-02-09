public class vfhello {

//Apex Class - Custom Controller

    //properties-variables
    public String message = 'HELLO VISUAL FORCE I\'m APEX';
    public String vfvalue {get;set;}
    
    //methods (getter ile mesaj yazdırdık)
    public String getMessage() {
        return message;
    }
    
    public PageReference setMessage(){
    message = vfvalue;
        return null;
    }
}