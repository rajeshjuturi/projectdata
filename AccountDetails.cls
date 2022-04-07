public with sharing class AccountDetails{
        public list<Account> accounts{get;set;}
        public String accountId{get;set;}
        public list<contact> contacts{get;set;}
        public AccountDetails(){
            accounts = [select Id,Name,AccountNumber,Phone from Account limit 15];
        } 
           public void onClick(){
    accounts=[SELECT id,Name FROM Account];
    }
}