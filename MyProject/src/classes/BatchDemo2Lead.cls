global class BatchDemo2Lead implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,LastName from lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> leadRecords){
        for(Lead l :leadRecords){
            l.LeadSource='Dreamforce';
        }
        try{
            update leadRecords;
        }catch(Exception e){
            System.debug(e);
        }
    }
    global void finish(Database.BatchableContext bc){
        
    }

}