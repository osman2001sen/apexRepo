public class generateNumber {
    
    public static Integer showNum {get; set;}	
    
    public static void generateNum(){                    
       showNum=Integer.valueOf(Math.random()*50); 
    }

}