global class BatchDemo3Stateful implements Database.Batchable<sObject>, Database.Stateful {
    
    global Integer recordProcessed=0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id, BillingStreet, BillingCity, BillingState' +
                                        'BillingPostalCode,(select id, MailingStreet, MailingCity,'+
                                         'MailingState, MailingPostalCode from Contacts) From Account' +
                                         'where BillingCountry = \'USA\''
                                       );
    }
    global void execute(Database.BatchableContext bc, List<Account> accRecords){
        List<Contact> conList = new List<Contact>();
        for(Account acc :accRecords){
            for(Contact con :acc.Contacts){
                con.MailingStreet =acc.BillingStreet;
                con.MailingCity = acc.BillingCity;
                con.MailingState = acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                recordProcessed =recordProcessed+1;
            }
        }
        try{
            update conList;
        }catch(Exception e){
            System.debug(e);
        }
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}