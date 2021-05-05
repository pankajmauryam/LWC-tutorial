public class AccountCreatedContact {
    public void onAfterInsert(list<account> TN)
    {
        validateAccount(TN);
    }
  static void  validateAccount(list<account> TN)
    {
        list<contact> lstCon=new list<contact>();
        for(Account acc:TN)
        {
            contact con=new contact(lastname='nirajkumar',F_Y__c='2018-19',accountid=acc.id,Department=acc.rating);
            lstCon.add(con);
        }
        if(lstCon.size() >0)
        {
        insert lstcon;
        }
    }

}