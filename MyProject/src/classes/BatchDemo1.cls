global class BatchDemo1 implements Database.Batchable<sObject> { 
    global Database.QueryLocator start(Database.BatchableContext bc){
       //String query = 'select id,name from account'; 
        //return Database.getQueryLocator(query);
        
        return Database.getQueryLocator([select id,name from Account]);
    }
    global void execute(Database.BatchableContext bc, List<Account> listRecords){
        for(Account acc :listRecords){
            acc.name =acc.name+'from Demo';
            acc.name=acc.name.remove('from Demo');
        }
        try{
            update listRecords;
        }catch(Exception e){
            System.debug(e);
        }
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}