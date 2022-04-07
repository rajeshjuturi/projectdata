public with sharing class AddressSearchController {
    @AuraEnabled
    public static List<contact> saveAccountRec(List<contact> conRecList){
        system.debug('conRecList--->'+conRecList);
        upsert conRecList;
        return conRecList;

    }
     @AuraEnabled(cacheable=true)
    public static List<Contact> fetcContact(String acctId){
        system.debug([Select id,firstName,LastName,AccountId,title,department from contact where accountId =:acctId]);
        return [Select id,firstName,LastName,AccountId,title,department from contact where accountId =:acctId];
    }
}