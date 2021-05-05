public class ContactUpdateAccountHandler {
public void  OnAfterUpdate(list<contact> TN)
{
    UpdateContactOnAccount(TN);
}
    void UpdateContactOnAccount(list<contact> TN)
    {
      list<account> lstAcctoUpdate=new list<account>();
        set<id> setAccId=new set<Id>();
        for(contact obj:TN)
        {
            if(obj.AccountID!=Null)
            {
                setAccID.add(obj.AccountID);
            }
        }
        if(setAccId.size()>0)
        {
            for(Account objA:[select ID,No_of_Contact__c,(select id from contacts) from Account where ID IN:setAccID])
            {
                objA.No_of_Contact__c=objA.contacts.size();
                lstAcctoUpdate.add(objA);
            }
            if(lstAcctoUpdate.size()>0)
            {
                update lstAcctoUpdate;
            }
        }
    }
}