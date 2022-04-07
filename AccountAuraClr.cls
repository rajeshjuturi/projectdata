public class AccountAuraClr {
            @AuraEnabled
    public static List<Account> getAccountRecord()
   {
        return new List<Account>([Select id,Name,Phone,Industry,Type from Account where Type != null LIMIT  100]);
    }
}