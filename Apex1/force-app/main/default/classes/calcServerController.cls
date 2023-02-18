public class calcServerController {
    // kitchen
   
	@auraenabled
    public static Decimal sumServer(Decimal number1,Decimal number2){
       Decimal result=0; 
        
        try{
            result = number1+number2;
            
        } catch(Exception e){
            throw new AuraHandledException('Error Message : '+ e.getMessage());
            
        }
        
       return result;
     }
    
    
    @auraenabled
    public static Decimal subServer(Decimal number1,Decimal number2){
       Decimal result=0; 
        
        try{
            result = number1-number2;
            
        } catch(Exception e){
            throw new AuraHandledException('Error Message : '+ e.getMessage());
            
        }
        
       return result;
     }
    
    @auraenabled
    public static Decimal mulServer(Decimal number1,Decimal number2){
       Decimal result=0; 
        
        try{
            result = number1*number2;
            
        } catch(Exception e){
            throw new AuraHandledException('Error Message : '+ e.getMessage());
            
        }
        
       return result;
     }
    
    
    @auraenabled
    public static Decimal divServer(Decimal number1,Decimal number2){
       Decimal result=0; 
        
        try{
            result = number1/number2;
            
        } catch(Exception e){
            throw new AuraHandledException('Error Message : '+ e.getMessage());
            
        }
        
       return result;
     }

}