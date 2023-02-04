public class SchedulableInternship implements Schedulable{
    public void execute (SchedulableContext ctx){
        List<Lead> testLeads= [SELECT name FROM Lead WHERE Name LIKE '%test%'];
        Delete testleads;
    }
}

/*

Anonymous Window

SchedulableInternship deleteLeads= new SchedulableInternship();
String sch = '0 30 20 ? * FRI *';
String JobID = System.schedule( 'Delete Test Leads', sch, deleteLeads);

*/