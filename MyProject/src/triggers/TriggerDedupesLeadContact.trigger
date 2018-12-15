trigger TriggerDedupesLeadContact on Lead (before insert) {
    
    for(Lead l: Trigger.new){
        if(l.Email != null){
            List<Contact> dupCon =[select id from contact where email = :l.Email];
            if(dupCon.size()>0){
                //l.addError('DeDupes contact find can`t insert Lead with this Email');
                l.Duplicate_Contact__c =dupCon[0].id;
            }
            else
            {
              l.Duplicate_Contact__c=null;  
            }
        }
    }

}