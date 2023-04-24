Database.SaveResult[] srList = Database.insert(multiAcc,false);

for (Database.SaveResult sr : srList) {

    if (sr.isSuccess()) {

        // Operation was successful, so get the ID of the record that was processed

        System.debug('Successfully inserted account. Account ID: ' + sr.getId());

    }

    else {

        // Operation failed, so get all errors  
              
        for(Database.Error err : sr.getErrors()) {

            System.debug('The following error has occurred.'); 
                   
            System.debug(err.getStatusCode() + ': ' + err.getMessage());

            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
}