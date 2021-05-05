@istest
public class AccountCreatedContactTest {
@istest
    static void abcTest()
    {
        list<account> lstAcc=new list<account>();
       account acc=new account();
            acc.name='shivacool';
        acc.rating='hot';
           lstAcc.add(acc); 
        insert lstAcc;   
        AccountCreatedContact obj=new AccountCreatedContact();
        obj.onAfterInsert(lstAcc);
    }
}