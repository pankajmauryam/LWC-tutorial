public class AccountClassController {
    @AuraEnabled
    public static list<sObject> getAccountData(string recordId,String objectName)
    {
        list<sObject> returnlst = new list<sObject>();
        
       String sQuery='Select name,Phone,Rating,AccountNumber,type from Account where id=:recordId ';
        list<sObject> lstOfRecords = Database.query(sQuery);
        for(sObject obj:lstOfRecords)
        {
         returnlst.add(obj);   
        }
        system.debug(returnLst);
        return returnlst;
    }
}