public class LoginForm {
    
    public static String loginFormMethod(String username , String password){
        
        String loginMessage='';
        
        String uname='ahmet79';
        String Pass= '1234';
        
        if(username==uname && password==Pass){
            
            
            loginMessage='You logged in  successfuly.';  
            
        }          
        else if(username==uname && password!=Pass){
            
             loginMessage='You entered a wrong password.';  

        }   
        else if(username!=uname && password==Pass){
            
             loginMessage='You entered a wrong username.';  

    	}
        else{
              loginMessage='Your both username and password are incorrect.';  

        }
        return loginMessage;
     }

}