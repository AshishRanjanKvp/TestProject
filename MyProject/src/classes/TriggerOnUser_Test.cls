@isTest
public class TriggerOnUser_Test {
    
    static testMethod void testUserInsertion(){
    User u = new User(FirstName='ashish', LastName='Kumar', Email='ashish.ranjan@kvpcorp.com',
                      Username='ashish.ranjan@kvpcorp.com', Alias='Bittu', ProfileId ='00e6F000002mMvH ');
    insert u;
        }

}