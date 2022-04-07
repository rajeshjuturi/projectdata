public class AccountHandler {
    public static void createContacts(List<Account> accountlist){
        List<Contact> contactList = new List<Contact>();
        for(Account actObj:accountList){
            Contact contactObj = new Contact();
            contactObj.AccountId=actobj.Id;
            contactObj.LastName=actobj.Name;
            contactList.add(contactObj);
        }
        if(!contactList.isEmpty()){
            insert contactList;
        }
    }
    public static void createOpportunities(Map<id,Account> newAccountmap,map<id,Account>oldAccountMap){
        List<Opportunity> opportunitylist = new list<Opportunity>();
        for(Account actobj:newAccountMap.values()){
        if(newAccountMap.get(actObj.Id).Rating !=oldAccountMap.get(actObj.Id).Rating && newAccountMap.get(actObj.Id).Rating=='Ware'){
           Opportunity opportunityObj = new Opportunity();
            opportunityObj.AccountId=actObj.Id;
             opportunityObj.Name=actObj.Name;
             opportunityObj.StageName='Prospecting';
             opportunityObj.CloseDate=System.today();
            opportunitylist.add(opportunityObj);
        }
    }
         if(!opportunitylist.isEmpty()){
            insert opportunitylist;
}
}
}