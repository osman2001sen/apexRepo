public class UpdateDescription{
    
    public static void UpdateLeadDes(){
        List<Lead> lds = [SELECT Id,Description FROM Lead];
        List<Lead> newlds = New List<Lead>();
        
        for(Lead singlelead:lds){
            singlelead.Description='This lead\'s description was updated to apply bulk apex tests.';
            newlds.add(singlelead);
                
        }
        update newlds;
    }

}