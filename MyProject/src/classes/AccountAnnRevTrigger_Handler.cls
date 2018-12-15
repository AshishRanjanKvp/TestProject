public class AccountAnnRevTrigger_Handler {
    
     public static void distributeAnnualRev(List<Account> accList){
        List<Contact> conList= new List<Contact>();
        Map<ID,Decimal> mapCon= new Map<ID,Decimal>();
        Decimal count= 0;
        for(Account acc: accList){
            mapCon.put(acc.ID,acc.AnnualRevenue);
        }
        for(AggregateResult ar:[Select Count(ID) cnt, AccountID ids From Contact where AccountID in:mapCon.keySet()
                                group by AccountID]){
            count=(Decimal)ar.get('cnt'); 
        }
        for(Contact con :[Select id,description,AccountID from Contact Where AccountID in:mapCon.keySet()]){
            con.Description=String.valueOf(mapCon.get(con.AccountID)/count);
            conList.add(con);                
        }        
        update conList;
    }

}