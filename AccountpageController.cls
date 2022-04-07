public class AccountpageController{
       public List<Account> accountList{set;get;}
       public Account accountDetail{set;get;}
       private Map<Id,Account> accountMap=new Map<id,Account>();
       public boolean showAccountListBlock{Set;get;}
       public boolean showAccountDetailBlock{Set;get;}
       public AccountpageController(){
              fetchAccounts();
       }
       
       public void fetchAccounts(){    
              for(account acc:[select id,name,Accountnumber from Account]){
                  accountMap.put(acc.id,acc);
              }
              accountlist=accountMap.values();
              showAccountListBlock=true;
              showAccountDetailBlock=false;
       }
       public void showAccountDetail(){
              
              String accid=apexpages.currentpage().getparameters().get('accId');
              accountDetail=accountMap.get(accid);
              showAccountListBlock=false;
              showAccountDetailBlock=true;
       }
       public void backtoACcounts(){
                     showAccountListBlock=true;
                    showAccountDetailBlock=false;
       }

}