public class Inbounnd_Example_2 implements Messaging.InboundEmailHandler{
    public Messaging.InboundEmailResult handleInboundEmail
                           (Messaging.InboundEmail email , Messaging.InboundEnvelope env){
 
           Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

           String fromAdd = email.fromAddress;
           Contact con =[select Id from Contact where email =:fromAdd];

           try{ 
                Case cs = new Case();
                cs.contactId =con.Id;
                cs.Origin ='Email';
                cs.Priority ='Email';
                cs.Status ='New';
                cs.Subject = email.subject;
                cs.Description = email.plainTextBody;

                insert cs;

           //======================== Files Attachment ========================
                // To receive Multiple Files(Attachment) from Email at once; create a List
               List<Messaging.InboundEmail.BinaryAttachment> myFiles =email.BinaryAttachments;
                // creating a List of new Attachments by coping the properties from Incoming
                // Attachments=====> So that we can Insert these attachments as Child to the
                // Case
                List<Attachment> files = new List<Attachment>();
                //Fetching files from the List one-by-one and transferring its 
                // properties to Separate newly created Attachments linked to the Case
                for(Messaging.InboundEmail.BinaryAttachment b :myFiles){
                      

                      Attachment a =new Attachment(); // new Attachment created
                      a.ParentId =cs.Id; // linked to the case
                      // Properties are transferred from the Incoming-Files to the newly 
                      // created Attachment.
                      a.body = b.body;
                      a.Name = b.fileName;

                      files.Add(a);  // Adding to the List of new Attachment           
                 }

                 Insert files;

                 result.success =true;

           }catch(exception e){
                 result.success =false;
           }

           return result;
          
    }
}