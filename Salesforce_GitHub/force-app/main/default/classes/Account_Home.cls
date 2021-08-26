public class Account_Home{

       public Account acc{get; set;}
       // Creating a Constructer with Apexpage.StandardController as Parameter
       public Account_Home(Apexpages.StandardController controller){
              // return the record referred by StandardController
              acc =(Account)controller.getRecord();
       }

      // Save & Take to the saved-Page for new record. If Duplicate record found Throw
      // Error Message----> we are Replacing the Standard Save-Button functionality
      public pageReference save(){
             // fetching how many Account records are there with the same Name
             Integer count =[select count() from Account where name= :acc.Name];
             if(count > 0){ 
                  // Duplicate record exists-----> Create an Error Message  
                  Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.Error,
                                                               'Duplicate record found');
                  Apexpages.addMessage(msg);
                  return null;
             }else{   
                  // No Duplicate Record is there, So Saving this one.
                  Insert Acc;  // Saving the Account record
                  // After saving; taking user to this page 
                  pageReference p =new PageReference('/'+acc.Id); 
                  return p;
             }

             
      }
}