public class Help1 {
    public static void createaccount(List<Account> acccList){
        List<Account> ListRecords=[select Id,Name from Account];
        set<String> name=new set<String>();
        for(Account acc:ListRecords){
            name.add(acc.name);
        }
        for(Account acc:acccList){
            if(!name.add(acc.name)){
                acc.addError('sorry');
            }
        }
    }
}