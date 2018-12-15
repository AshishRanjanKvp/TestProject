/* ***************************************************************************************************************************
 * Class Name: Account_ContactDescription
 * Created By: Ashish Ranjan
 * Created Date: 05-11-2018
 * Description: Update contact Description with account description if industry in Banking, Communication, Agriculture.
 * ****************************************************************************************************************************/

public class Account_ContactDescription
{
    public static void Update_Description(Set<Id> accountIds)
    {
          list<Account> accountsWithContacts =[select Id,Name, (select Id,FirstName,LastName from Contacts) from Account 
                                                                           where Id IN : accountIds];
           list<Contact> contactsToUpdate=new list<Contact>();
            for(Account a:accountsWithContacts)   //loop through all queries 
          {
                 for(Contact convals:a.Contacts)
                {
                        convals.Description= a.Description;
                        contactsToUpdate.add(convals);
               }
           }
           update contactsToUpdate;
    }
}