public class AccountWrapper{
        
        @AuraEnabled public string accountname{set;get;}
        @AuraEnabled public string accounttype{set;get;}
        @AuraEnabled public string accountphone{set;get;}
        @AuraEnabled public string accountwebsite{set;get;}
        
        public AccountWrapper(string accountname,string accountphone,string accountwebsite,string accounttype){
            this.accountname= accountname;
            this.accountphone= accountphone;
            this.accountwebsite= accountwebsite;
            this.accountType= accountType;
        }
    }