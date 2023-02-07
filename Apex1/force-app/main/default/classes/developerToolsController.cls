public class developerToolsController {

 
//properties - variables
public Integer howMany {get;set;}
public String prefix {get;set;}
public List<Account> multiAcc {get;set;}
public String searchTerm {get;set;}


    // constructor method
    public developerToolsController(){
        howMany=0;
        prefix='';
        multiAcc =New List<Account>();
    }
    
       public PageReference createAcc() {
       
           for(Integer x=1;x<=howMany;x++ ){
               Account singleAcc = New Account();
               singleAcc.Name=prefix+' - '+x;
               multiAcc.add(singleAcc);
           
           }
           insert multiAcc;
       
        return null;
    }


   public PageReference deleteAcc() {
       delete multiAcc;
       
       multiAcc.clear();
       
        return null;
    }


    public PageReference searchAcc() {
    
    String SearchSOQL = '%'+searchTerm+'%';
    
    multiAcc=[SELECT Id, Name, Phone, Website,Industry FROM Account WHERE Name LIKE :SearchSOQL];
        return null;
    }



   public PageReference updateAcc() {
   
       update multiAcc;
       
        return null;
    }


 



}