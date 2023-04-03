/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Workers {
    
    //Properties non-static
    public String name;
    private Integer workinghours=0;
    private Decimal income=0;
    private Decimal expense=0;
    
    //Properties static 
    public static Integer totalhours=0;
    public static Decimal totalincome=0;
    public static Decimal totalexpense=0;
    
    //Methods for hours
    public void addHours(Integer howMany){  
        workinghours+=howMany;
        totalhours+=howMany;
    }
    
    public Integer hours(){                 
        return workinghours;
    }
    
    //Methods for income
    public void addIncome(Decimal additionalIncome){    
        income+=additionalIncome;
        totalincome+=additionalIncome;
    }
    
    public Decimal individualIncome(){                
        return income;
    }
    
    //Methods for expenses
    public void addExpense(Decimal additionalExpense){      
        expense+=additionalExpense;
        totalexpense+=additionalExpense;
    }
    
    public Decimal individualExpense(){               
        return expense;
    }
    
}