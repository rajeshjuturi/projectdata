@isTest
public class AccountlistwithcontactListTest {

    @Testsetup static void testdata(){
         Account Account = new Account();
         Account.Name='test account';
         Account.AccountNumber='234264';
         Account.Phone='273523582';
         Account.Website='http://edgecomm.com';
         insert Account;
        
        Contact Contact = new Contact();
        Contact.AccountId=Account.Id;
        Contact.FirstName='test Contact';
        Contact.LastName='test1';
        Contact.Phone='374834985';
        insert Contact;
            }
    @istest static void testdat1(){
        
       Account acc=[select id,phone from Account where Account.Phone='273523582'];
      Contact con =[Select Id, FirstName, LastName, Email, Phone, AccountId From Contact where Contact.lastname='test1'];
        Test.startTest();
        AccountlistwithcontactList.retrieveAccountRecords();
        AccountlistwithcontactList.retrieveContactRecords(acc.Id);
       
        Test.stopTest();
    }
}