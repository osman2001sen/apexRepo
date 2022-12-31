//Apex Class Screen

public class workers {
    
	//properties (non-static)
	
    public String name;
    public Integer working_hours;
    public Decimal income;
    public Decimal expense;
}

//Enter Apex Code Screen

// datatype variableName = Exp

workers alex = New workers();

System.debug(alex.name);

alex.name = 'Alex Victor';

System.debug(alex.name);