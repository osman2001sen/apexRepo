List<Course__c> multiCourse = [SELECT Id, Name, CreatedDate, 
                               (SELECT Id, Name, CreatedDate FROM Lessons__r) 
                               FROM Course__c]; //Parent to Child

for(Course__c singleCourse:multiCourse){
    System.debug('-'+singleCourse.name);
    //System.debug(singleCourse.Lessons__r);
    for(Lesson__c singleLesson:singleCourse.Lessons__r){
        System.debug(singleLesson.Name);
    }
}