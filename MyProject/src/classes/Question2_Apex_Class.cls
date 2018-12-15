/***************************************************************************************************
 * Created By 	: Ashish Ranjan
 * Created Date : 05-11-108
 * Class Name 	: Question2_Apex_Class
 * Description 	: Update all lead with address match "other info" object field
 * *************************************************************************************************/
public class Question2_Apex_Class {
    public void updateAllLead(){
        List<OtherInfo__c> otherinfolist=[select id,city__c,state__c,zipcode__c from OtherInfo__c];
        List<Lead> leadList=[select id,PostalCode,State,City from lead];
        for(Lead ld:leadList){
            for(OtherInfo__c info:otherinfolist){
                if(ld.State==info.state__c && ld.City==info.city__c){
                 ld.PostalCode= string.valueOf(info.zipcode__c);
                }
            }
        }
        update leadList;
    }
}