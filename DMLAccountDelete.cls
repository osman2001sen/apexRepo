public class DMLClass {

    public static void Remove(String n){

        List<Account> x=[SELECT ID, Name FROM Account];
        List<Account> z=New List<Account>();

        for(Account y:x){
            if(y.Name==n){
                z.add(y);
            }
        }
            
        delete z;
    }
}


// Anonymous Window
// DMLClass.Remove('Ozzie Tech');