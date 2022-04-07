public class AddendumFormController {
       //Class Members , variable,functions,constructor(d
       //declare constructor 
      public string addendumId{set;get;} 
      public Endorsement_Form__c endForm{Set;get;} 
      public boolean showForm{set;get;}
      
      public AddendumFormController(){
            
             addendumId=apexpages.currentpage().getparameters().get('ADDENDUMID');
             if(addendumId!=null &&  addendumId!=''){  
             endForm=[select id,name,Endorsement_Form_Status__c , Signed_By_Client__c, Client_Signatur__c, Date_Signed__c, Client_Name__c, Client_rate__c,CSA_Signup_Date__c,VA_Start_Date__c from Endorsement_Form__c where id=:addendumId];
               if(endForm.Signed_By_Client__c==false){
               endForm.Date_Signed__c=system.today();
               showForm=true;
               }else{
               showForm=false;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You have aleady submitted the form,Thank you for your patience'));

               }
             
             }
             
      }
      public PageReference submitaddendumform(){
              endForm.Endorsement_Form_Status__c='Approved';
              endForm.Signed_By_Client__c=true;
              update endForm;
           /*   PageReference pdfPage=new PageReference('/apex/addendumformpdf?ADDENDUMID='+endForm.id);
              Attachment att=new Attachment();
              att.body=pdfPage.getcontent();
              att.parentid=endForm.id;
              att.name='endorsementform.pdf';
             // insert att;
             */
              showForm=false;
              
              ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Thank You'));

             return null;     
      }
}