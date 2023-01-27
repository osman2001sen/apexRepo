public class DMLClass {
    
    public static void updateAcc(String s, String p){
        List<Account> x=[SELECT id, Name FROM Account];
        List<Account> z=new List<Account>();
        for(Account y:x){
            y.Site=s;
            y.Phone=p;
            z.add(y);
        }
        
        Update z;
    }              
}

//Anonymous Window
DMLClass.updateAcc('www.tricorcia.com', '133456789');