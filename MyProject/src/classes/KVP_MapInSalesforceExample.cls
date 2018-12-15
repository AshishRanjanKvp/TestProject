/*************************************************************************************************************************
 * @Created By :Ashish Ranjan
 * @Created Date:08/10/2018
 * Class Name:KVP_MapInSalesforceExample
 * Description:This class is for demonstration of Map Collection Methods and Constructors.
 * ***********************************************************************************************************************/
public class KVP_MapInSalesforceExample {
    //Creates a new instance of the Map class. T1 is the data type of the keys and T2 is the data type of the values.
    public KVP_MapInSalesforceExample(){
    Map<Integer, String> m1 = new Map<Integer, String>();  
    m1.put(1, 'Ashish Ranjan');
    m1.put(2, 'Rahul Ranjan');
       System.debug(m1); 
    //Creates a new instance of the Map class and initializes it by copying the entries from the specified map.
    // T1 is the data type of the keys and T2 is the data type of the values.
    Map<Integer, String> m2 = new Map<Integer, String>(m1);
        System.debug(m1);
    //Creates a new instance of the Map class and populates it with the passed-in list of sObject records. 
    //The keys are populated with the sObject IDs and the values are the sObjects.  
    List<Account> ls = [Select Id, Name From Account];
    Map<Id,Account> ml= new Map<Id, Account>(ls);
        System.debug(ml);
    //Removes all of the key-value mappings from the map.
    ml.clear();
        System.debug(ml);
    //Returns a list that contains all the values in the map.
    List<String> ll = new List<String>();
        ll = m1.values();
        System.debug(ll);
    //Returns the number of key-value pairs in the map.
        System.debug(m1.size());
    }
}