public class BodyMassIndex {
    
    public static Decimal calculateBMI(Decimal weight, Decimal height){
        
        if(weight>0 && height>0){
        	return weight/(height*height);
        } else{
        	return 0;
        }
    }
    
    public static String BMIPerson(String firstName, String lastName){
        String fullName= firstName +' '+ lastName;
        return fullName.toUpperCase();
    }

}