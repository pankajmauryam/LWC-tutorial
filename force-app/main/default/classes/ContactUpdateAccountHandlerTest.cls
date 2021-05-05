@isTest
public class ContactUpdateAccountHandlerTest {
@istest
    static void abctest()
    {
         list<account> lstAcc=new list<account>();
        account objA=new Account(name='hello');
        lstAcc.add(objA);
        insert lstAcc;
        list<contact> con=new list<contact>();
        contact obj=new contact(lastname='udit',f_y__c='2016-17',accountid=objA.id); 
        con.add(obj);
        insert con;
        ContactUpdateAccountHandler cu=new ContactUpdateAccountHandler();
        cu.OnAfterUpdate(con); 
       
    }
}