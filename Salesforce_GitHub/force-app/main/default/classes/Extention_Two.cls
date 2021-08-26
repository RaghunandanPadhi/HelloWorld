public class Extention_Two {
    public string name     {set;get;}
    public Decimal salary   {set;get;}
    // Constructer
    public Extention_Two(Apexpages.StandardController controller){
        name='Praveen';
        salary=5000;
    }
    public void invoke(){
        name='Extention Two';
    }

    public void callMe(){
        salary=10000;
    }
}