public class AccountListComponentController {
@AuraEnabled
    public static Id insertAccount(String getName)
    {
       Account objAcc = new Account();
        objAcc.Name= getName;
        insert objAcc;
        return objAcc.Id;
    }
}