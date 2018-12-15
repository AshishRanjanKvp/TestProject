public class AccOppContactController {
    public Account getAccount(){
        return [select id,name,(select id,firstname,lastname from contacts),(select id,Name,Amount from Opportunities)
                from account where id =:System.currentPageReference().getParameters().get('id')];
    }
}