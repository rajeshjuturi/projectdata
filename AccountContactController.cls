public with sharing class AccountContactController {
    @AuraEnabled(cacheable=true)
    public static Account fetchAccount(String accountId){
        Account acct = new Account();
        if(String.isNotBlank(accountId)) {
            acct = [SELECT Id, Name, Type, Rating, Phone, Website, AnnualRevenue
                    FROM Account Where Id =: accountId];
        }
        return acct;
    }
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(){
        return [SELECT Id, Name, FirstName,LastName, Phone, Email, Account.Name FROM Contact
                Where AccountId != '' Order by LastName DESC limit 10];
    }
    @AuraEnabled(cacheable = true)
    public static List<Jira_credentials__mdt> customobject(){

        List<Jira_credentials__mdt> meatalist =[select id,Jira_UserName__c,Jira_Password__c from Jira_credentials__mdt];

        return meatalist;
    }
}