public class Account_Update{
     // Creating a Constructer with StandardController parameter
     public Account acc{set; get;}
     // to store the corresponding contacts and Opportunity of the Current Account
     public List<Contact> contacts {get; set;}
     public List<Opportunity> optyList {get; set;}  
     public Account_Update(Apexpages.StandardController controller){
           // controller.getRecord only gives you Id of the record
           // Apart of Id if you want to get any other fields, Put the desired fields in a 
           // List & use controller.addFields()

           List<String> fields = new 
                           List<String>{'Name','Phone','Industry','Rating','Ownership'};
           controller.addFields(fields);
           acc = (Account)controller.getRecord();
     }

     // To fetch the corresponding Contact & Opportunity of this Account
     public void callMe(){
            contacts =[select Id, LastName, FirstName,Phone from Contact where
                                                          AccountId =: acc.Id];
            optyList =[select Id,Name,StageName,CloseDate,Amount from Opportunity
                                                        where AccountId =:acc.Id];
            
     }
}