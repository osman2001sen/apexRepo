public class DMLClass {
    
    public static void updateAcc(String s, String p){
        List<Account> x=[SELECT id, Name FROM Account];
        
        for(Account y:x){
            y.Site=s;
            y.Phone=p;
        }
        
        update x;
        
    } 
      
}

//Anonymous Window
DMLClass.updateAcc('www.tricorcia.com', '133356789');