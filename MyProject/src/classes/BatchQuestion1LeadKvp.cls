global class BatchQuestion1LeadKvp implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id, LastName, company from Lead where company=\'KVP\'');
    }
    global void execute(Database.BatchableContext bc, List<Lead> leadList){
        List<Lead> ll = new List<Lead>();
        for(Lead l :leadList){
            Lead l1 = new Lead();
            l1.LastName= l.LastName;
            l1.Company = l.Company;
            l1.Status = l.Status;
            ll.add(l1);
        }
        try{
            insert ll;
        }catch(Exception e){
           System.debug(e); 
        }
    }
    global void finish(Database.BatchableContext bc){
        
    }

}