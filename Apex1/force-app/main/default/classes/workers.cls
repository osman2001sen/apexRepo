public class workers {
    
    //INNER CLASS
    public class course{
        
        //property
        public String name;
        public Integer numSession;
        public Integer numStudent;
        
        //method
        public course(String courseName){
            name=courseName;
        }
        
        
    }
    
    //Properties non-static (Object'ler için kullanılır. Alex, Sergio,,, NOT workers)
    public String name;
    private Integer working_hours=0;
    private Decimal income=0;
    private Decimal expense=0;
    
    //Properties static (Apex class için kullanılır. Workers için. Total.)
    public static Integer total_hours=0;
    public static Decimal total_income=0;
    public static Decimal total_expense=0;
    
    //Constructor Method
    public workers(String workersName){  //class ile aynı name, class'tan kaç tane kopyaladık onu gösteriyor
        System.debug('Constructor method is working...');
        name=workersName;
    }
    
    
    //Methods for hours
    public void addHours(Integer howMany){
        working_hours+=howMany;
        total_hours+=howMany;
    }
    
    public Integer hours(){
        return working_hours;
    }
    
    //Methods for income
    public void addIncome(Decimal additionalIncome){
        income+=additionalIncome;
        total_income+=additionalIncome;
    }
    
    public Decimal individualIncome(){
        return income;
    }
    
    //Methods for expenses
    public void addExpense(Decimal additionalExpense){
        expense+=additionalExpense;
        total_expense+=additionalExpense;
    }
    
    public Decimal individualExpense(){
        return expense;
    }
    
}