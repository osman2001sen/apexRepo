workers alex = New workers();
workers sergio= New workers();

alex.name='Alex Victor';
sergio.name='Sergio Taco';

System.debug('alex name ' + alex.name);

alex.addHours(5);
alex.addHours(3);
alex.addHours(2);
System.debug('alex working hours (private) ==> alex hours() ' + alex.hours());

System.debug('sergio name ' + sergio.name);
sergio.addHours(15);
sergio.addHours(2);
System.debug('sergio working hours (private) ==> sergio hours() ' + sergio.hours());

System.debug('workers total hours: '+workers.total_hours);

//Income
alex.addIncome(5000.00);
alex.addIncome(3000.00);
alex.addIncome(1000.00);
System.debug('Individual income for Alex: '+alex.individualIncome());

sergio.addIncome(5000.00);
sergio.addIncome(4000.00);
System.debug('Individual income for Sergio: '+sergio.individualIncome());

System.debug('Total income for workers: '+workers.total_income);

//Expense
alex.addExpense(1000.00);
alex.addExpense(2000.00);
System.debug('Individual expense for Alex: '+alex.individualExpense());

sergio.addExpense(2000.00);
sergio.addExpense(1800.00);
System.debug('Individual expense for Sergio: '+sergio.individualExpense());

System.debug('Total expense for workers: '+workers.total_expense);