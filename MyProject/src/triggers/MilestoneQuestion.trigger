trigger MilestoneQuestion on Opportunity (after insert,after update) {
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        MilestoneQuestion_Helper.milestoneCheck(Trigger.new);
    }
}