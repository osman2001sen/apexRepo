@isTest
public class CalcTest {
    
	@isTest
    	public static void sumTest(){
        
        Integer actual = Calc.sum(10,10); // 10+10 = 20
        
        System.assertEquals(20, actual);
        
        actual = Calc.sum(-10,10); // -10+10 = 0
        
        System.assertEquals(0, actual);
        
        actual = Calc.sum(-10,-10); // -10-10 = -20
        
        System.assertEquals(-20, actual);
        
        
        
    }
    
    @isTest
    public static void subTest(){
        
        Integer actual = Calc.sub(10,10); // 10-10 = 0
        
        System.assertEquals(0, actual);
        
        actual = Calc.sub(-10,-10); // -10-10 = -20
        
        System.assertEquals(-20, actual);
        
    }
    
    @isTest
    public static void mulTest(){
        
        Integer actual = Calc.mul(10,10); // 10*10 = 100
        
        System.assertEquals(100, actual);
        
        actual = Calc.mul(10,0); // 10*0 = 0      //Bir kere yukarıda Integer actual = dedik ---> Aşağıda actual = , diye devam ettik.
        
        System.assertEquals(0, actual);
        
        actual = Calc.mul(-10,-10); // -10*-10 = 100
        
        System.assertEquals(100, actual);
        
    }
    
    
    @isTest
    public static void divTest(){
        
        Decimal actual = Calc.div(10,10); // 10/10 = 1
        
        System.assertEquals(1, actual);

        
        actual = Calc.div(10,0); // 10/0 = 0

        System.assertEquals(0, actual);

        
       	actual = Calc.div(10,4); // 10/4 = 2.5

        System.assertEquals(2.5, actual);

        
        actual = Calc.div(-10,4); // -10/4 = -2.5

        System.assertEquals(-2.5, actual);

        
        actual = Calc.div(-10,-4); // -10/-4 = 2.5

        System.assertEquals(2.5, actual);
        
        
    }

}