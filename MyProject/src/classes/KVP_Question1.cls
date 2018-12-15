/********************************************************************************************************************
 * @
 * @
 * @
 * ******************************************************************************************************************/
public class KVP_Question1 {
    public static void insertDMLOperation(){
        // Create the account sObject 
        Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
        // Insert the account by using DML
        insert acct;
        // Get the new ID on the inserted sObject argument
        ID acctID = acct.Id;
       // Display this ID in the debug log
       System.debug('ID = ' + acctID);
       // Debug log result (the ID will be different in another case)
       // DEBUG|ID = 0016F00002go5JtQAI
       /* List<Account> acctList = new List<Account>{new Account(Name='AshIsh Ranjan'),
            new Account(name='Kullu Tiwari'),
            new Account(Name='Baba Ramdev'),
            new Account(Name='Narendra Modi'),
            new Account(Name='Piyush Goyal'),
            new Account(Name='Ravishamkar Prasad'),
            new Account(Name='Nitin Gadkari')};
                insert acctList;   */     
    }
    public static void updateDMLOperation(){
        List<Account> listToUpdate = new List<Account>{new Account(Id='0016F00002gnv7VQAQ',name='Baba Ramdev')};
            update listToUpdate;
        // Create a list of contacts
        List<Contact> conList = new List<Contact> {
              new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
              new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
              new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
              new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
            
       // Bulk insert all contacts with one DML call
       insert conList;
      // List to hold the new contacts to update
       List<Contact> listToUpdate1 = new List<Contact>();
      // Iterate through the list and add a title only
      //   if the department is Finance
      for(Contact con : conList) {
            if (con.Department == 'Finance') {
                 con.Title = 'Financial analyst';
                 // Add updated contact sObject to the list.
                 listToUpdate1.add(con);
        }
    }
     // Bulk update all contacts with one DML call
     update listToUpdate1;
    } 
    public static void upsertDMLOperation(){
        // Insert the Josh contact
        Contact josh = new Contact(FirstName='Josh',LastName='Kaplan',Department='Finance');       
        insert josh;
       // Josh's record has been inserted
       //   so the variable josh has now an ID
      //   which will be used to match the records by upsert
      josh.Description = 'Josh\'s record has been updated by the upsert operation.';
     // Create the Kathy contact, but don't persist it in the database
     Contact kathy = new Contact(FirstName='Kathy',LastName='Brown',Department='Technology');
     // List to hold the new contacts to upsert
     List<Contact> contacts = new List<Contact> { josh, kathy };
    // Call upsert
    upsert contacts;
    // Result: Josh is updated and Kathy is created.
    } 
    public static void deleteDMLOperation(){
        Contact[] contactsDel = [SELECT Id FROM Contact WHERE LastName='Smith']; 
        delete contactsDel;
    } 
}