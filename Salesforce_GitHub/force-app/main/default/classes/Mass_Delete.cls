public class Mass_Delete{
   // the List will holds the group of Accounts on which the Mass Action will be performed
    public List<Account> accounts {set; get;}
    // the parameter StandardSetController refers to a Group of records
    public Mass_Delete(Apexpages.StandardSetController controller){
           // Apart of Id if you want to refer any other fields of the record:
           List<String> fields =new List<String>{'Name','Phone','Industry','Rating'};
           controller.addFields(fields);
           // getSelected : We want Only the selected records out of all the records
           accounts = (List<Account>)controller.getSelected();
    }
    
    // Delete the selected records then go to Account's Home page
    public PageReference deleteData(){
           Database.delete(accounts,false); // Non-Atomic operation
           PageReference p = new Pagereference('/001/o'); // Account Homepage URL
           return p;
    }
}