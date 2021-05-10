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
    @AuraEnabled
    public static void createdName(String accountNameFromText,String accountMobileNumberFromInput){
        try {
            Account acc = new Account();
            acc.Name = accountNameFromText;
            acc.Phone = accountMobileNumberFromInput;
            insert acc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}