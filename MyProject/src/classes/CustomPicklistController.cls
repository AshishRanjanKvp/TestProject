public class CustomPicklistController {
    public String SelectedColor{get;set;}
    public List<SelectOption> listColor{get;set;}
    
    
    
    public CustomPicklistController(){
            SelectedColor='';
            listColor = new List<SelectOption>();
        listColor.add(new Selectoption('','----None----'));
        listColor.add(new Selectoption('yellow','yellow'));
        listColor.add(new Selectoption('Red','Red'));
        listColor.add(new Selectoption('Wheat','Wheat'));
        listColor.add(new Selectoption('Blue','Blue'));
        listColor.add(new Selectoption('Black','Black'));
    }
    
    //public PageReference testM(){return null;}
}