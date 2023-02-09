public class vfCalc {

   
    public Double result { get; set; }
    public Double x {get; set; }
    public Double y {get; set; }
    
    
     public PageReference sum() {
     
     result =x+y;
        return null;
    }
    public PageReference sub() {
     
     result =x-y;
        return null;
    }
    public PageReference mul() {
     
     result =x*y;
        return null;
    }
    public PageReference div() {
     
     result =x/y;
        return null;
    }
}