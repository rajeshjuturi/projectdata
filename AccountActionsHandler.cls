public class AccountActionsHandler{
  public static void createContacts(List<Account> accountsList){
    
    List<Contact> contactList = new List<Contact>();
     for (Account actObj:accountsList){
     Contact contactObj = new Contact();
     contactObj.AccountId=actObj.Id;
     contactObj.LastName =actObj.Name;
     contactList.add(contactObj);
     }
     if(!contactList.isEmpty()){
     insert contactList;
     }
     }
    public static void createOpportunites(Map<id,Account> newAccountMap,Map<id,Account>oldAccountMap){
        List<Opportunity> Opportunitylist= new List<Opportunity>();
        for(Account actObj:newAccountMap.values()){
           
                Opportunity opportunityObj=new Opportunity();
                opportunityObj.AccountId=actObj.Id;
                opportunityObj.Name=actObj.Name;
                opportunityObj.StageName='Prospecting';
                opportunityObj.CloseDate=system.today();
                Opportunitylist.add(opportunityObj);
            
        }
        if(!Opportunitylist.isEmpty()){
            insert Opportunitylist;
        }
        
    }
    
    
    
     }