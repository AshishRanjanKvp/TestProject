global  class BatchQuestion2ConAcc implements Database.Batchable<sObject> {
     global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('');
    }
    global void execute(Database.BatchableContext bc, List<Contact> conList){
      
    }
    global void finish(Database.BatchableContext bc){
        
    }


}