public class Greeting {
    
    String firstName='Smith';
    
    public String fullName(){
        String lastName='Tesla';
        String fName=firstName+' '+lastName;
        return fName;
    }
    
    public String greeting(){
        String greeting='Hi';
        return greeting +' '+fullName();
    }
    
    
    public void greetingAll(List<String> nameList){
        for(String greetName:nameList){
            System.debug('Hi '+greetName);
        }
    }
    
    public void greetingAllButLast(List<String> nameList){
        for(String noLastName:nameList){
            System.debug('Hi '+noLastName.split(' ')[0]);
        }
    }
    
    public void greetingtoSmith(List<String> nameList){
        for(String justSmith1:nameList){
            String justSmith2=justSmith1.split(' ')[0];
            if(justSmith2=='Smith'){
                System.debug('Hi '+justSmith2);
            }
        }
    }
}