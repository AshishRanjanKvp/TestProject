trigger Question1 on Contact (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
    Question1_Helper.doDuplicateCheckOnContactMobileInsert(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
    Question1_Helper.doDuplicateCheckOnContactMobileUpdate(Trigger.New);
    }

}