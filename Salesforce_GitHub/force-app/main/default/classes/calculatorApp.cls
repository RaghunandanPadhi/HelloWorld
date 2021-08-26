public class calculatorApp{
    public Decimal aVal   {set;get;}
    public Decimal bVal   {set;get;}
    public Decimal result {set;get;}
    
    public void add(){
        result = aVal + bVal;
    }
    
    public void sub(){
        result = aVal - bVal;
    }
    
    public void mul(){
        result = aVal * bVal;
    }
    
    public void div(){
        result = aVal / bVal;
    }
    
    public void reset(){
        aVal =null;
        bVal =null;
        result =null;
    }
    
    
}