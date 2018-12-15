/***************************************************************************************************************************
 * created By:
 * Created Date:
 * Description:
 * *************************************************************************************************************************/
public class KVP_Solution3 {
    //Method for creating Account
    public static void createAccount(){
        List<Account> acctList = new List<Account>{new Account(name='AAA1'),
            new Account(name='BBB1'),
            new Account(name='CCC1')};
                insert acctList;
        
    }
    public static void createContactAndOpportunity(){
        for(Integer i=0;i<3;i++){
            Contact con = new Contact();
            con.LastName='Lname'+i;
            Opportunity opp = new Opportunity();
            opp.Name='opp'+i;
            opp.Type='New Customer';
            opp.Discount_Percent__c=24;
        }
    }
}