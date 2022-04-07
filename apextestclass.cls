@isTest
public with sharing class apextestclass {
   
    public static Lead createLead(Boolean doInsert){
        Lead newLead= new Lead();
        newLead.FirstName='Cole';
        newLead.LastName='Swain';
        newLead.Company='BlueWave';
        newLead.Status='contacted';
        if(doInsert){
            insert newLead;
        }
        return newLead;
    }
    
}