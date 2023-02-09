public class vfAccount {

    public PageReference create() {
    
    Account singleAcc = New Account();
        singleAcc.Name=accName;
        insert singleAcc;
        
        String newURL = '/lightning/r/Account/' + singleAcc.id + '/view';
        PageReference pageRef = New PageReference(newURL);
        
        return pageRef ;
    }


public String accName {get;set;}



}