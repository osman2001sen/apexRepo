public class workers {
    
	//properties (non-static)
	
    public String name;
    private Integer working_hours=0;
    public Decimal income;
    public Decimal expense;
    
    //method
    public void addHours(Integer howMany){
        working_hours+=howMany;
    }
    
    public Integer hours(){
        return working_hours;
    }
}