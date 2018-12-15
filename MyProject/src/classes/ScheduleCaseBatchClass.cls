/*********************************************************************************************************************************
     * Schedule from Developer console:
     * BatchScheduleUpdate batchSch=new BatchScheduleUpdate();
     * String sch='0 0 19 * * ?';
     *System.schedule(String jobName, String cronExp, APEX_OBJECT schedulable);
     *System.schedule('Batch Schedule', sch , batchSch);
*********************************************************************************************************************************/
global class ScheduleCaseBatchClass implements Schedulable {
 
    global void execute(SchedulableContext  sc){
      CaseBatchClass cbc = new CaseBatchClass();
        Database.executeBatch(cbc);
    } 

}