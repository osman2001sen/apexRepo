public class converter{
    
    public static decimal kmtomile(Decimal km){
        
          //1 km = 0.62137119 mile
          
        decimal mile=km*0.62137119; 
        
        return mile;
    }
    
    public static decimal miletokm(Decimal ml){
        
       //1 mile = 1,609344 km
          
        decimal km=ml*1.609344; 
        
        return km;

	}
}