trigger TopXTrigger on Top_X_Designation__c (after insert) {
    Set<Id> idSet = new Set<Id>();
    for(Top_X_Designation__c txid:Trigger.new){
        idSet.add(txid.id);
    }
   List <Opportunity> oppList = new List<Opportunity>();
        for(Top_X_Designation__c tx :Trigger.new){
            if((tx.Type__c=='Contract Flow Down' || tx.type__c=='Handoff') && tx.Document_Attached__c==true){
                Opportunity opp = new Opportunity(id=tx.Opportunities__c);
                opp.Handoff_Attached__c='Yes';
                oppList.add(opp);
            }
            update oppList;
        }
    }