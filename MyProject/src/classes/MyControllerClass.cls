public class MyControllerClass {
    
    Account account;
    
    //methos for save action
    public Pagereference save(){
        update account;
        return null;
    }
    
    //getter method
    public String getName(){
        return 'MyControllerClass';
    }
    
    //Just mimic the account standard controller functionality
    public Account getAccount(){
        return [select id, name from account where id =: Apexpages.currentpage().getParameters().get('id')];
    }
}