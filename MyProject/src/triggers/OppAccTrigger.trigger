trigger OppAccTrigger on Opportunity (after insert,after update,after delete) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        
        List<Account> lst = new List<Account>();
        for(Opportunity opp1 : Trigger.new){
            Account acc = new Account(id=opp1.AccountId);
            acc.AnnualRevenue=acc.AnnualRevenue+opp1.Amount;
            lst.add(acc);
        }
        if(!lst.isEmpty()){
            update lst;
        }
        
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        List<Account> lst2 = new List<Account>();
        for(Opportunity opp2 : Trigger.new){
            if(opp2.Accountid!=null && opp2.Amount!=Trigger.oldMap.get(opp2.accountid).Amount){
                Account acc1 = new Account(id=opp2.AccountId);
                acc1.AnnualRevenue=acc1.AnnualRevenue+opp2.Amount;
                lst2.add(acc1);
            }
            if(!lst2.isEmpty()){
            update lst2;
            }
        }
        
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        List<Account> lst3 = new List<Account>();
        for(Opportunity opp3 : Trigger.old){
            if(opp3.AccountId!=null){
                Account acc2 = new Account(id=opp3.AccountId);
                acc2.AnnualRevenue=acc2.AnnualRevenue-opp3.Amount;
                lst3.add(acc2);
            }
            if(!lst3.isEmpty()){
            update lst3;
            }
        }
        
    }

}