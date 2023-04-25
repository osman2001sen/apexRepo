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