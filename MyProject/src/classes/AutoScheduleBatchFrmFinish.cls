global class AutoScheduleBatchFrmFinish implements Database.Batchable<sObject> {
   
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select id,Name from contact]);
    }
    
    global  void execute(Database.BatchableContext bc, List<Contact> scope){
        for(Contact con : scope){
            con.Description='from testing ';
        }
        try{
            update scope;
        }catch(Exception e){
            System.debug(e);
        }
    }
    
    global  void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        AsyncApexJob a =[Select a.TotalJobItems, a.Status, a.NumberOfErrors,
                         a.JobType, a.JobItemsProcessed, a.ExtendedStatus, 
                         a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
        if(a.Status == 'Completed'){
            List<CronTrigger> scheduledJobs = [Select id from cronTrigger where CronJobDetail.name = 'Scheduler'];

                     if(scheduledJobs.isEmpty())
                         {
                           Decimal minutes=1;
                           Decimal chunkSize=200;
                           Boolean isChaining=true;

         if(isChaining)
             System.scheduleBatch(new AutoScheduleBatchFrmFinish(),'Scheduler',minutes.intValue(),chunkSize.intValue());
             }
        }
        
        String []email = new String []{'ashisharms2@gmail.com'};
            mail.setToAddresses(email);
            mail.setReplyTo('ashisharms2@gmail.com');
            mail.setSenderDisplayName('Apex Batch Processing');
            mail.setSubject('Batch Processing '+a.Status);
            mail.setPlainTextBody('The Batch Apex job processed '
                                  +a.TotalJobItems+'batches with '
                                  +a.NumberOfErrors+'failures'
                                  +'Job Item processed are'
                                  +a.JobItemsProcessed);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }    

}