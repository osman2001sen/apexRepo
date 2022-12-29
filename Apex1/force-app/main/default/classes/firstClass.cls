public class firstClass {
    //properties without ()
    private Integer classNumber;
    public static String username;

    //methods with ()
    
    //setter method (memur)
    public static void setUserName(String newUserName){
        username=newUserName;
    }
    
    //getter method (memur)
    public static String getUserName(){
        return username;
    }
    
    public static void welcome(){
        if(String.isNotBlank(username)){
            System.debug('Hello Apex Class '+ username);
        }
        else{
            System.debug('Hello Bro...');
        }
    } 
}