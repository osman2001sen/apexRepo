List<String> studentNames = New List<String>();
studentNames.add('Alex Victor');
studentNames.add('Sergio Taco');
studentNames.add('Elon Musk');
studentNames.add('Donald Trump');
studentNames.add('Vladimir Putin');
System.debug(studentNames);


for(String student:studentNames){
    System.debug('First Name: '+student.split(' ').get(0) + '----- Last Name: '+student.split(' ').get(1));
}