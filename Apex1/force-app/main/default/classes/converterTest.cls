@isTest
public class converterTest{
    
    @isTest
    public static void kmtomileTest(){
       decimal actual= converter.kmtomile(100);
        
        
       System.assertEquals(62.137119, actual);
    }
        
    @isTest
    public static void miletokmTest(){
       decimal actual= converter.miletokm(100);
        
        
        System.assertEquals(160.9344, actual);
    }

}