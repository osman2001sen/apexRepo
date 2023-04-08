workers alex = New workers('Alex Victor'); 
workers sergio= New workers('Sergio Taco');

System.debug('alex name ' + alex.name);

alex.addHours(5);
System.debug('alex working hours (private) ==> alex hours() ' + alex.hours());

System.debug('sergio name ' + sergio.name);
sergio.addHours(15);
System.debug('sergio working hours (private) ==> sergio hours() ' + sergio.hours());

System.debug('workers total hours: '+workers.total_hours);

//Income
alex.addIncome(500);
System.debug('Individual income for Alex: '+alex.individualIncome());

sergio.addIncome(50);
System.debug('Individual income for Sergio: '+sergio.individualIncome());

System.debug('Total income for workers: '+workers.total_income);

//Expense
alex.addExpense(5);
sergio.addExpense(50);

System.debug('Alex Expense: '+alex.individualExpense());
System.debug('Sergio Expense: '+sergio.individualExpense());
System.debug('Total Expense: '+workers.total_expense);