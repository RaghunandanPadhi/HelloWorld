public class Account_List {
    public List<Account> accounts {set;get;}
    // Constructor
    public Account_List(){
        // Shorting the Account by Descending-order of Last-Modified-Date and fetching 5
        // records
        accounts =[select id,Name from Account order by LastModifiedDate DESC limit 5];
    }
}