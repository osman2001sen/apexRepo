List<Lesson__c> multiLesson = [SELECT Course__r.Name, 				 
                               Id, Name, CreatedDate, Course__c 
                               FROM Lesson__c];

for (Lesson__c singleLesson:multiLesson){
    System.debug('------------Lesson(Child)----------------');
    System.debug(singleLesson.Name);
    System.debug('------------Course(Parent)----------------');
    System.debug(singleLesson.Course__r.Name);
}