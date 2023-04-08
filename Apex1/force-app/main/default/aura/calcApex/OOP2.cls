/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-08-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class workers {
    
    //Properties non-static
    public String name;
    private Integer working_hours=0;
    private Decimal income=0;
    private Decimal expense=0;
    
    //Properties static
    public static Integer total_hours=0;
    public static Decimal total_income=0;
    public static Decimal total_expense=0;

    public workers(String workersName){
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