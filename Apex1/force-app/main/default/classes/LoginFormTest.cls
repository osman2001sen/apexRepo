@isTest
public class LoginFormTest{
    
    @isTest
	public static void loginFormMethodA( ){
        
        String result=loginForm.loginFormMethod('ahmet79','1234');
        
        System.assertEquals('You logged in  successfuly.', result);     
        
             }
    
    @isTest
    public static void loginFormMethodB( ){
                
        String result=loginForm.loginFormMethod('ahmet79','12345');
        
        System.assertEquals('You entered a wrong password.', result);     
        
             }       
    
    @isTest
    public static void loginFormMethodC( ){
                
        String result=loginForm.loginFormMethod('ali98','1234');
        
        System.assertEquals('You entered a wrong username.', result);     
        
             }       
    
    @isTest
    public static void loginFormMethodD( ){
                
        String result=loginForm.loginFormMethod('ahmedt79','127734');
        
        System.assertEquals('Your both username and password are incorrect.', result);     
        
             }       
}