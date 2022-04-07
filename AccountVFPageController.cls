public class AccountVFPageController {
       public list<Account> listOfAccounts{set;get;}
    public string searchKey{set;get;}
       public AccountVFPageController(){
              listOfAccounts=[select id,name from Account];
       }
    public void searchAccounts(){
            
         //  listOfAccounts=[select id,name from Account where name=:searchKey];
         String searchString='%'+searchKey+'%';
         listOfAccounts=[select id,name from Account where name LIKE :searchString];

    }
}