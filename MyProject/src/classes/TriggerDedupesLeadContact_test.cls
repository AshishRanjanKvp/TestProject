@isTest
public class TriggerDedupesLeadContact_test {
    
    static testMethod void testDup(){
        
        Contact c = new Contact();
        c.LastName='kullume';
        c.Email='kullume@gmail.com';
        insert c;
        
        Lead l = new Lead();
        l.LastName='kulluyou';
        l.Company='Kullukcp';
        l.Email='kullume@gmail.com';
        
        try{
            insert l;
        }catch(Exception e){
            System.debug(e);
        }
        
        List<Lead> llist= [select id from Lead where email='kullume@gmail.com'];
         System.assertEquals(0, llist.size());
        
        Lead l2 = new Lead();
        l2.LastName='kulluyou';
        l2.Company='Kullukcp';
        l2.Email='kulluyou@gmail.com';
        insert l2;
        
        List<Lead> llist2 =[select id from Lead where email='kulluyou@gmail.com'];
        System.assertEquals(1, llist2.size());
        
    }

}