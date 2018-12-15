global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID, BillingStreet, BillingCity, BillingState, '+
                                        'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
                                        'MailingState, MailingPostalCode FROM Contacts) FROM Account '+
                                       'Where BillingCountry = \'USA\''
                                       );
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contact> conList = new List<Contact>();
        for(Account account :scope){
            for(Contact contact :account.Contacts){
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;
                conList.add(contact);
            }
             recordsProcessed = recordsProcessed + 1;
        }
        update conList;
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        //EmailUtils.sendMessage(job, recordsProcessed);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String [] toAddresses = new String[] {job.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Sharing Recalculation ' + job.Status);
        mail.setPlainTextBody('The batch Apex job processed ' + job.TotalJobItems +
                              ' batches with '+ job.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }

}