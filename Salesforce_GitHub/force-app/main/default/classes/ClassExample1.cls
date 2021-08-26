public with sharing class ClassExample1 {
    public static List<Account> getAccounts(){
        return [select Id,Name from Account];
    }
    
}