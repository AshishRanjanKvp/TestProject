trigger AccountAnnRevTrigger on Account ( after update){
    
    //if(Trigger.isAfter && Trigger.isInsert ){
      AccountAnnRevTrigger_Handler.distributeAnnualRev(Trigger.New);  
    //}

}