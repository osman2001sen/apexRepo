/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class gameController {
    
    public static Integer inputValue{get;set;}
    public static String msgPositive{get;set;}
    public static String msgNegative{get;set;}
  
    
    public static void numberChecker(){
        integer x = integer.valueOf(Math.random()*100);
        
        if(inputValue==x){
            msgPositive='Congratulations! You got it!'+' (System guess: '+x+')';
        }else{
            msgNegative='Sorry! Try again!'+' (System guess: '+x+')';
        }
        
        System.debug(x);
    }

}