public class UpsertTest {
    public static void upsertTest()
    {
Contact josh = new Contact(FirstName='Josh', LastName='Holen', Department='Finance');
    insert josh;
    josh.Description='Josh`s record has been updated by the upsert operation';
Contact kathy = new Contact(FirstName='kathy', LastName='sharma', Department='Technology'); 
    List<Contact> contacts = new List<Contact>{josh,kathy};
        upsert contacts;
    }
}