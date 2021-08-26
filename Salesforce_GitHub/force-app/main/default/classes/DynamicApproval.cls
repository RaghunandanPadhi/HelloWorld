public class DynamicApproval{
    public static void callMe(List<Account> accs){
        //user u =[select id from user where alias='dreddy'];
        
        for(Account a :accs){
            if(a.rating == 'Hot'){
                Approval.processSubmitRequest request = new Approval.processSubmitRequest();
                request.setObjectId(a.id);
                List<Id> approvers = new List<Id>{a.Manager__c};
                request.setNextApproverIds(approvers);
                request.setProcessDefinitionNameOrId('Testing');
                request.setcomments('Customer Approval Process This is');
                request.setSubmitterId(UserInfo.getUserId());
                request.setskipEntryCriteria(true);
                Approval.processResult result = Approval.process(request);
                
            }
        }
        
    }
}