global class MyCaseBatchSMS implements Database.Batchable<sObject>
{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        
        string query='select id,Mobile_Number__c from case where caseNumber= \'00001030\' ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Case> lstCase)
    {
        system.debug('@@lstAsset'+lstCase);
        if(!lstCase.isEmpty())
        {
            list<string> getMobile = new list<string>();
           
            for(Case obj :lstCase)
            {
                if(obj.Mobile_Number__c != null)
                {
                    
                    
                       getMobile.add(obj.Mobile_Number__c);
                   
                    
                }
                else
                {  
                    getMobile.add(obj.Mobile_Number__c); 
                } 
            }
           if(getMobile.size() > 0)
           {
            MyCommonClass.sendOTP(getMobile) ;
           }
            
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
 /*    global void execute(SchedulableContext sc)  {  
        
    }  */
}