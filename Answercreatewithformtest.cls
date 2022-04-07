@isTest
public class Answercreatewithformtest {
   
    @Testsetup static void testdat(){
        
        Form_Template__c Form_Template = new Form_Template__c();
        Form_Template.Name='Test template';
        insert Form_Template;
        
        Question__c Question = new Question__c();
        Question.Form_Template__c=Form_Template.Id;
        Question.Question_Type__c='tesxt';
        Question.Question_Label__c='url';
        Question.Question_Id__c='6868';
        insert Question;
    }
    @isTest Static void testdat2(){
        Form_Template__c FormTemplate = [select id,Name from Form_Template__c where Form_Template__c.Name='Test template'];
        Test.startTest();
        Form__c Form = new Form__c();
        Form.Form_Template__c=FormTemplate.Id;            
        insert Form;
        
       Test.stopTest();
        
        List<Question__c> QuestionList =[select id,Form_Template__c from Question__c];
        List<Answer__c> Answerlist=[select id from Answer__c];
        System.assertEquals(QuestionList.size(), Answerlist.size());
        
    }
    
}