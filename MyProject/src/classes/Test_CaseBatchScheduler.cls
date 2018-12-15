@isTest
private class Test_CaseBatchScheduler {
    
    @isTest static void test1(){
        String cropExp ='0 0 19 * * ?';
        
        Case c = new Case();
        c.Status='New';
        c.Origin='Web';
        insert c;
        
        /*Test.startTest();
        String jobId = System.schedule('Schedule Case Batch Class', cropExp, new CaseBatchClass());
        CronTrigger ct =[select Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(cropExp, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        //Test.stopTest();*/
    }

}