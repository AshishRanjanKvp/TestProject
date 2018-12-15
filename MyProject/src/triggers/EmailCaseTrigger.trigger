trigger EmailCaseTrigger on Case (before insert) {
    
    //Create a set of all value to query
    Set<String> emailSet = new Set<String>();
    for(Case cs :Trigger.new){
        if(cs.suppliedEmail !=null){
            emailSet.add(cs.suppliedEmail);
        }
    }
    
    //query for all records in step 1
    List<User> potUser =[select id,email from user where email in :emailSet];
    
    //Associate each result with correct query Result
    Map<String, User> emailToUserMap = new Map<String, User>();
    for(User u :potUser){
        emailToUserMap.put(u.email, u);
    }
    for(Case c :Trigger.new){
        if(c.suppliedEmail!=null){
            User usr = emailToUserMap.get(c.suppliedEmail);
            if(usr !=null){
               // c.CreatedById=usr.id;
            }
        }
    }

}