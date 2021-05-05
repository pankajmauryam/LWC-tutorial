public class DisplayAccountInfoController {
    @AuraEnabled
    public static Account getAccountInfo(String recordId)
    {
        return [select id,Phone,Name from account where id=:recordId];
    }

}