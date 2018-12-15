trigger Contacttrigger on Contact (after insert,after update) {
    
    //Set to hold AccountId for All newly updated or inserted Contact
    Set<Id> accIdSet = new Set<Id>();
    for(Contact con :Trigger.New){
       accIdSet.add(con.AccountId);
    }
    
    List<Account> accUpdateList = new List<Account>();
    List<String> lastnameList = new List<String>();
    for(Account acc:[SELECT id,name,shisharmsdigita__Contact_Name_List__c,(SELECT lastname from contacts) FROM Account where id IN:accIdSet]){
        for(Contact conn :acc.contacts){
            if(conn.LastName != null){
            lastnameList.add(conn.lastname);
            }
        }
        acc.shisharmsdigita__Contact_Name_List__c=String.join(lastnameList, +',');
        accUpdateList.add(acc);
        
        lastnameList.clear();
    }
    try{
      update accUpdateList;  
    }catch(Exception e){
        System.debug(e);
    }
}