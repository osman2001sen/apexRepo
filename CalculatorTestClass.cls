@isTest
public class CalculatorTest {
    
    @isTest
    public static void sumTest(){      
        
        Integer actual = Calculator.sum(10, 10); //10+10=20  --> Expected result
        
        System.assertEquals(20, actual); //(expected, actual) --> Positive test (assertEquals).
    }

    @isTest
    public static void subTest(){      
        
        Integer actual = Calculator.sub(10, 10); //10-10=0  --> Expected result
        
        System.assertEquals(0, actual); //(expected, actual) --> Positive test (assertEquals).  
    }
    
    @isTest
    public static void mulTest(){      
        
    Integer actual = Calculator.mul(10, 10); //10*10=100  --> Expected result
        
    System.assertEquals(100, actual); //(expected, actual) --> Positive test (assertEquals).
    }
    
    @isTest
    public static void divTest(){      
        
    Integer actual = Calculator.div(10, 10); // 10/10=1  --> Expected result
        
    System.assertEquals(1, actual); //(expected, actual) --> Positive test (assertEquals).
    }
}