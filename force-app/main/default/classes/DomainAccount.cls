public without sharing class DomainAccount {
    public void onChangeName(list<Account> TN,Map<Id,Account> TOM){
            for(Account acc: TN)
            {
                 decimal count=1; 
                if(acc.Name != null && acc.Name != TOM.get(acc.Id).Name)
                {
                    if(acc.wk_count__c==null)
                    {
                      acc.wk_count__c = 1;  
                    }else if(acc.wk_count__c!=null)
                    {
                    count= count + acc.wk_count__c; 
                    acc.wk_count__c = count;
                    }
                }
            }
  
    }
}