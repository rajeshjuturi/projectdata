public class AccountHierarchyController {
public Account acc { get; private set; }
public List<Account> accountList { get; private set; }
public ApexPages.StandardController controller { get; private set; }
  public AccountHierarchyController(ApexPages.StandardController controller) {
    this.acc = (Account)controller.getRecord();
    this.accountList = new List<Account>();

    Account baseAccount = [SELECT Id, 
                           ParentId, 
                           Name,
                           Parent.Name,
                           (SELECT ContractNumber,StartDate,Contract_renewed__c FROM Contracts),
                           (SELECT Id, Name FROM ChildAccounts)
                           FROM Account 
                           WHERE Id = :acc.id];
    accountList.add(baseAccount);

    // Traverse the hierarchy downwards
    Set<Id> accountsToQuery = new Map<Id, Account>(baseAccount.ChildAccounts).keySet();
    while (accountsToQuery.size() > 0) {
        List<Account> thisLevelAccounts = [SELECT Id, Name, Parent.Name,
                                           (SELECT ContractNumber,StartDate,Contract_renewed__c FROM Contracts),
                                           (SELECT Id, Name FROM ChildAccounts)
                                           FROM Account
                                           WHERE Id IN :accountsToQuery];
        accountsToQuery = new Set<Id>();

        for (Account a : thisLevelAccounts) {
            // Add this Account (with its Contracts) to the list.
            accountList.add(a);

            // Add this Account's children to the query for the next level.
            for (Account child : a.ChildAccounts) {
                accountsToQuery.add(child.Id);
            }
        }
    }
}
}