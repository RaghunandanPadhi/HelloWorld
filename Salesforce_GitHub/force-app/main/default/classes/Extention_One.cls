public class Extention_One {
    public string name {set;get;}
    public string city {set;get;}
    // Construter
    public Extention_One(Apexpages.StandardController controller){
        name='Ravi Kiran';
        city='Hyd';
    }
    
    public void invoke(){
        name='Extention One';
        city='Extention One';
    }
}