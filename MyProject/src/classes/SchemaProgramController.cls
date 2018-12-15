public class SchemaProgramController {
    
    public List<SelectOption> options{get;set;}
    
    public SchemaProgramController(){
        options = new List<SelectOption >();
        Map<String, Schema.SObjectType> schemamap = schema.getGlobalDescribe();
        Set<String> objSet = schemaMap.keySet();
        for(String str :objSet){
            SelectOption  op = new SelectOption (str,str);
            options.add(op);
        }
    }

}