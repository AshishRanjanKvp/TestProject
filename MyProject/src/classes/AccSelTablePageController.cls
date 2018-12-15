public class AccSelTablePageController {
    public List<AccountCheckBoxWrapper> wrapAccount{get;set;}
    public List<Account> selectedAccount{get;set;}
    public String todelAcc{get;set;}
    
    public AccSelTablePageController(){
        wrapAccount = new List<AccountCheckBoxWrapper>();
        for(Account a:[select id,name,phone from Account LIMIT 10]){
            wrapAccount.add(new AccountCheckBoxWrapper(a));
        }
    }
    
    public void processSelected(){
        selectedAccount = new List<Account>();
        for(AccountCheckBoxWrapper acw :wrapAccount){
            if(acw.selected==true){
                selectedAccount.add(acw.acc);
            }
        }
    }
    
    public PageReference  deleteAccount(){
        
        List<Account> accList = new List<Account>();
        accList =[select id from account where id =:todelAcc];
        if(accList.size()>0){
            delete accList;
        }
        PageReference pr = new PageReference('/apex/AccSelTablePage');
        pr.setRedirect(true);
        return pr;
    }
    
    public class AccountCheckBoxWrapper{
        public Account acc{get;set;}
        public boolean selected{get;set;}
        
        public AccountCheckBoxWrapper(Account a){
            acc=a;
            selected=false;
        }
    }

}