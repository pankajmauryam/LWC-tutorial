public class AccountTaskHandler {
public void onAfterInsert(list<Account> TN)
{
    CreateTask(TN);
}
    void CreateTask(list<Account> TN)
    {
        list<Task> lstTask=new list<Task>();
        for(Account acc:TN)
        {
            task objT=new task();
           // objT.Whoid=  acc.id;
            ObjT.subject='Task Created on Account creation';
            ObjT.OwnerId= acc.OwnerID;
            objT.Priority='LOW';
              objT.Status='In progress';
             objT.whatId=acc.Id;
            objT.CurrencyIsoCode=userinfo.getDefaultCurrency();
            lstTask.add(objT);
        }
         if(lstTask.size()>0)
        {
        insert lstTask;
        }
    }
}