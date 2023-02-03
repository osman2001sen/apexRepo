public class CalculateOpportunity {

    public String accid {get;set;}
    public List<Opportunity> multiop {get;set;}
    
    public Decimal totalamount=0;

    // get method
    public Decimal gettotalamount() {
        
      for(Opportunity singleOp:multiop){
        totalamount+=singleOp.Amount;
      }
        
        return totalamount;
    }
    
    

    // constructor method
    public CalculateOpportunity(ApexPages.StandardController controller) {
        accid = ApexPages.currentPage().getParameters().get('id');
        
        
        multiop = New List<Opportunity>();
        
        system.debug('Constructor is working....');
        
        multiop = [SELECT Id, Name, Amount, CloseDate,StageName FROM Opportunity WHERE accountid=:accid];
        
        
        
    }

}