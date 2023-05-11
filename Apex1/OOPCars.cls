/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Define a class called Car
public class Car {
    // Define instance variables
    private String make;
    private String model;
    private Integer year;
    private Double price;
    
    // Define a constructor
    public Car(String make, String model, Integer year, Double price) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.price = price;
    }
    
    // Define getter methods for instance variables
    public String getMake() {
        return make;
    }
    
    public String getModel() {
        return model;
    }
    
    public Integer getYear() {
        return year;
    }
    
    public Double getPrice() {
        return price;
    }
    
    // Define a method to calculate the resale value of the car
    public Double calculateResaleValue() {
        Double resaleValue = price * 0.7;
        if (year < 5) {
            resaleValue = resaleValue * 1.1;
        }
        return resaleValue;
    }
}
