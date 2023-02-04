public class QueueableInternship implements Queueable {
    public void execute (QueueableContext qc1){
        List<Lead> lds =[SELECT Id, Name FROM Lead
                              WHERE Name LIKE '%Test%' ];
        List<Lead> ldds= new List<Lead> ();
        for(Lead ld: lds){
            ld.description= 'This Lead is Updated using Queueable Apex';
           ldds.add(ld);
        }
        update  ldds;
    }
}


/*
Anonymous Window

System.enqueueJob(new QueueableInternship());
*/
