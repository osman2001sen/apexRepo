public class ExecuteUpdateContactEmailBatch {
    public static void main(String[] args) {
        String newEmailValue = 'new.email@example.com';
        String conditionField = 'MailingCountry'; // Replace with the desired field API name
        String conditionValue = 'United States'; // Replace with the desired field value

        // Instantiate the batch class
        UpdateContactEmailBatch updateEmailBatch = new UpdateContactEmailBatch(newEmailValue, conditionField, conditionValue);

        // Execute the batch class
        Database.executeBatch(updateEmailBatch);

        System.debug('Batch job started. Check the debug logs for progress and results.');
    }
}
