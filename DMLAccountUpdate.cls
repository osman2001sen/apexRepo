public class withsharing DMLClass {							
    		
    public static void Guncelle(String s, String p){
        List<Account> x=[SELECT id, Name FROM Account];			
        
        for(Account y:x){
            y.Site=s;
            y.Phone=p;
        }
        
        update x;
        
    }
}