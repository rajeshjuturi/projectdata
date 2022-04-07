@isTest
private class AccountTest {

     private static testMethod void testCreateContact(){
        Account actObj= new Account();
        actObj.Name='Rajesh juturi';
        actObj.Industry='Engineering';
        actObj.Type='Other';
        Test.startTest();
        insert actObj;
        Test.stopTest();
        Contact contObj=[select id,name from Contact where accountId=:actObj.Id];
        System.assert(contObj.Id!=null);
    }
    private static testMethod void testcreateOpportunites(){
        Account actObj= new Account();
        actObj.Name=' rahul';
        actObj.Industry='MCA';
        actObj.Type='Other';
         actObj.Rating='Hot';
        Test.startTest();
        actObj.Rating='Ware';
        insert actObj;
        Test.stopTest();
    Opportunity oppObj=[select id,name from Opportunity where accountId=:actObj.Id];
        System.assert(oppObj.Id!=null);
    }
}