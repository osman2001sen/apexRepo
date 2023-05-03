@future
public static void updateAccounts(List<Account> accountsToUpdate) {
    for (Account acc : accountsToUpdate) {
        acc.Description = 'Updated Account';
    }
    update accountsToUpdate;
}