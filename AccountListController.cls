public class AccountListController {
    
    @AuraEnabled
    public static List<Account> fetchAccts(){
        return [select Id, Name,Industry,Type From Account LIMIT 10];                       
    }
}