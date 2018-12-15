public class WorkbenchController {
    
    public List<SelectOption> options{get;set;}
    public String objectVal{get;set;}
    public List<String> objectFields{get;set;}
    Map<String, Schema.SObjectType> schemaMap = schema.getGlobalDescribe();
    
    public WorkbenchController(){
        objectVal='';
        options = new List<SelectOption>();
        Set<String> objectName = schemaMap.keyset();
        options.add(new SelectOption('None','----None----'));
        for(String str :objectName){
            Selectoption op = new Selectoption(str,str);
            options.add(op);
        } //end of for loop
    } //end of constructor
} //end of class