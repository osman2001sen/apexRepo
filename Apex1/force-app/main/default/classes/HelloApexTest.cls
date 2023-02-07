@isTest
public class HelloApexTest {
    
    @isTest
    public static void helloTest1(){
        String actual=HelloApex.msg('test');
        System.assertEquals('TEST Clarusway Salesforce Cohort 3', actual);  //Positive Test ve geçti
        
    }
    
    @isTest
    public static void helloTest2(){
        String actual=HelloApex.msg('test');
        System.assertNotEquals('test', actual);  //Negative Test ve geçti.
        
    }
    
    @isTest
    public static void helloTest3(){
        String actual=HelloApex.msg('test');
        System.assertNotEquals('TEST Clarusway Salesforce Cohort 3', actual);  //Negative Test ve kaldı.
        
    }

}