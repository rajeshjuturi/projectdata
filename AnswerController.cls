public with sharing class AnswerController {
    @AuraEnabled(cacheable=true)
    public static list<Answer__c> getAnswerRecords(){
        List<Answer__c> Answerlist= [Select id,name,form__c,question__c from Answer__c where form__c != null limit 10];

        return Answerlist;

    }
}