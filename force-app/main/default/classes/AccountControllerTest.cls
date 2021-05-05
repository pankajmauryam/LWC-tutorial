@istest(seealldata=false)
public class AccountControllerTest
{
    @isTest
    public static  void abctest()     
    {
        account ac = new account(name='test',rating='cold');
        insert ac;
        AccountController obj = new AccountController();
        
       ApexPages.StandardController sc = new ApexPages.StandardController(ac);
        obj = new AccountController(sc);
    }
}