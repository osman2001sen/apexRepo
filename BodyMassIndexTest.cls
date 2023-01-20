@isTest
public class BMITest {
    
    @isTest
    public static void calculateBMITest(){ 						//Positive Behaviour Test
        Decimal result= BodyMassIndex.calculateBMI(80, 2);
        System.debug(result);
        
        System.assertEquals(20, result);
    }
    
     @isTest
    public static void calculateBMITest2(){ 					//Negative Behaviour Test
        Decimal result=BodyMassIndex.calculateBMI(-75, 0);
        System.debug(result);
        
        System.assertEquals(0, result);
    }
    
    @isTest
    public static void BMIPersonTest(){							//Positive Behaviour Test
        String result=BodyMassIndex.BMIperson('Osman', 'Sen');
        
        System.assertEquals('OSMAN SEN', result);
    }
}