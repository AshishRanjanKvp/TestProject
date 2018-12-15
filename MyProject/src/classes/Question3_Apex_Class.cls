/***************************************************************************************************
 * Created By 	: Ashish Ranjan
 * Created Date : 05-11-108
 * Class Name 	: Question3_Apex_Class
 * Description 	: Update all lead with address match "other info" object field
 * *************************************************************************************************/
public class Question3_Apex_Class {
	//create duplicate contact
    public void createduplicateAccountContact(){
        List<AggregateResult> countofcontact=[select count(id) ct,accountid actid from contact group by AccountId];
        set<Id> accountids=new set<Id>();
        for(AggregateResult agg:countofcontact){
            if(math.mod((Integer)agg.get('ct'), 2)==0){
            accountids.add((Id)agg.get('actid'));
            }
        }
        list<Contact> conList=[select Id,Name,Account.name,AccountId from contact where accountid in:accountids];
        List<Account_Dummy__c> dupRecords=new List<Account_Dummy__c>();
        for(contact con:conList){
            Account_Dummy__c ob=new Account_Dummy__c();
            ob.Name=con.Name;
            dupRecords.add(ob);
        }
        insert dupRecords;
    }
}