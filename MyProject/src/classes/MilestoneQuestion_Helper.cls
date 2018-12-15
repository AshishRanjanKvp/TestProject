public class MilestoneQuestion_Helper {
    
    public static void milestoneCheck(List<Opportunity> oppList){
        Set<Id> idSet = new Set<Id>();
        for(Opportunity op :oppList){
            idSet.add(op.Id);
        }
        
        Map<Id,Account> mapAcc = new Map<Id,Account>([select shisharmsdigita__Milestone__c,shisharmsdigita__Milestone_Opportunity_Id__c
                                                      from Account where id in :idSet]);
        List<Opportunity> oppToupsert = new List<Opportunity>();
        for(Opportunity op2 : oppList){
            if(mapAcc.get(op2.Id).shisharmsdigita__Milestone__c<5000000){
                Opportunity opp = new Opportunity(id=op2.id);
                oppToupsert.add(opp);
                mapAcc.get(op2.Id).shisharmsdigita__Milestone__c+=op2.Amount;
            }
            else{
                Opportunity opp = new Opportunity(id=op2.id);
                oppToupsert.add(opp);
                mapAcc.get(op2.id).shisharmsdigita__Milestone_Opportunity_Id__c=op2.id;
            }
        }
      upsert oppToupsert;  
    }

}