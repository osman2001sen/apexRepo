public class SchedulableInternship implements Schedulable{
    public void execute (SchedulableContext ctx){
        List<Lead> testLeads= [SELECT name FROM Lead WHERE Name LIKE '%test%'];
        Delete testleads;
    }
}