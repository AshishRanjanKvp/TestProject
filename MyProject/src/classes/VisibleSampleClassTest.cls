@isTest
private class VisibleSampleClassTest {
    @isTest static void testVisibleSampleClass(){
        VisibleSampleClass vs = new VisibleSampleClass();
        vs.recordNumber = 100;
        vs.areaCode ='(420)';
        
        VisibleSampleClass.Employee emp = new VisibleSampleClass.Employee('Ashish','7895230593');
        String s = vs.privateMethod(emp);
        
        System.assert(s.contains('Ashish') && s.contains('7895230593') && s.contains('(420)'));
        
    }
    
    @isTest static void testVisibleSampleClass2(){
        try{
            throw new VisibleSampleClass.MyException('Thrown from test');
        }catch(VisibleSampleClass.MyException e){
            
        }
    }
    
    @isTest static void testVisibleSampleClass3(){
       VisibleSampleClass as2 = new VisibleSampleClass();
        as2.publicMethod();
    }

}