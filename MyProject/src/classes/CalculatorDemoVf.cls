public class CalculatorDemoVf {
    
    public PropertyClass value{get;set;}
        
    public CalculatorDemoVf(){
          value = new PropertyClass();
        }  
    
    public void clear(){
        value = new PropertyClass();
    }
    
    public void calc(){
       
        value.sumRes = 'Sum' + (value.num1+value.num2);
        value.subRES = 'Sub' + (value.num1-value.num2);
        value.mulRes = 'Mul' + (value.num1*value.num2);
        value.DivRes = 'Div' + (value.num1/value.num2);
    }
}