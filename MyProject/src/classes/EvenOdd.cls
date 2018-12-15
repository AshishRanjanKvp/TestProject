/* ***************************************************************************************************************************
 * Class Name: EvenOdd
 * Created By: Ashish Ranjan
 * Created Date: 05-11-2018
 * Description: even odd .
 * ****************************************************************************************************************************/
public class EvenOdd {
    public static void doEvenOdd(){
        List<Account_Dummy__c> lst = new List<Account_Dummy__c>();
        for(Account acc :[select id,name,(select id from contacts) from account]){
            if(acc.contacts.size()/2==0){
                for(Integer i;i<acc.contacts.size();i++){
                    Account_Dummy__c adc = new Account_Dummy__c();
                    adc.name=acc.Name +i;
                    lst.add(adc);
                }
                if(!lst.isEmpty()){
                insert lst;
            }
            
            }
        }
    }

}