public class EnterSearchController {
    
    public String strKey{get;set;}
    public List<Account> lstAccount{get;set;}
    public EnterSearchController(){
        lstAccount= new List<Account>();
    }
    public PageReference cancel(){
        return new pageReference('/001/o');
    }
    public void search(){
        if(strKey!=null && strKey!=''){
            String wildcard ='%'+strKey+'%';
            lstAccount =[Select name from Account where Name like:wildcard];
        }
    }

}