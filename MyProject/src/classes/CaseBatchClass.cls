/**********************************************************************************************************************************
 * @Created By: Aashish Ranjan
 * @Created Dtae: 20-11-2018
 * @Class Name:CaseBatchClass
 * @Description: Batch Class for case.
 * *******************************************************************************************************************************/
global class CaseBatchClass implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
         System.debug('Doneeeeee');
        return Database.getQueryLocator([SELECT id,Status,Comments FROM Case where Status='New']);
    }
    
    global void execute(Database.BatchableContext bc, List<Case> caseList){
        List<Case> cc = new List<Case>();
        for(Case c : caseList){
            c.status='Closed';
            c.Comments='Updated from batch apex';
            cc.add(c);
            System.debug('Doneeeeee');
        }
        update cc;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }

}