// BatchApexContactUpdateUsage.cls
public class BatchApexContactUpdateUsage {
    public void executeBatch() {
        BatchApexContactUpdate batch = new BatchApexContactUpdate();
        Integer batchSize = 20; 
        
        Database.executeBatch(batch, batchSize);
    }
}
