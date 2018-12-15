trigger OneContactPerAccount on Contact (before insert) {
    // create a map of contacts keyed by their account id
    Map<Id, List<Contact>> contactsByAccountId=new Map<Id, List<contact>>();
    for (Contact cont : trigger.new)
    {
        // exclude private contacts
        if (cont.AccountId!=null) 
        {
            List<Contact> contactsForAccount=contactsByAccountId.get(cont.AccountId);
            if (null==contactsForAccount)
            {
                //contactsForAccount=new List<Id>();
                contactsByAccountId.put(cont.AccountId, contactsForAccount);
            }
            contactsForAccount.add(cont);
        }
    }

    // now get the total number of contacts for each account
    Set<Id> ids=contactsByAccountId.keySet();
    List<AggregateResult> ars=[select AccountId, count(id) from Contact where AccountId in :ids group by AccountId];    

    // now iterate the results and error anything that already has a contact
    for (AggregateResult ar : ars)
    {
        Id accId=(Id)ar.get('AccountId');
        Integer contactCount=(Integer)ar.get('expr0');
        if (contactCount>0)
        {
            List<Contact> contactsForAccount=contactsByAccountId.get(accId);
            for (Contact cont : contactsForAccount)
            {
                cont.addError('Max one contact per account');
            }
        }
    }
}