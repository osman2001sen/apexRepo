/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-24-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class compareNumbers {
    
    public static Integer num1{get;set;}
    public static Integer num2{get;set;}
    public static String msg{get;set;}
    public static String result{get;set;}
    public static String err{get;set;}
    
    public static Void compare(){
        msg='Your numbers are the same. Please enter different numbers!';
        if(num1>num2){
            result=String.ValueOf(num1);
        }else if(num2>num1){
            result=String.ValueOf(num2);
        }else{
            err=msg;  
        }
    }
    
}