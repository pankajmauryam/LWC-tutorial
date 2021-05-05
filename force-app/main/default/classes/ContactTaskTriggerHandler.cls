public class ContactTaskTriggerHandler {
public void OnAfterInsert(list<contact> TN)
{
    CreateTask(TN);
}
  void CreateTask(list<contact> TN)
    {
        list<task> lstTask=new list<task>();
        
        for(contact objC:TN)
        {
            Task objT=new Task();
            objT.OwnerId=objC.ownerId;
            objT.WhoID=objC.ID;
            objT.Priority='Low';
            objT.Subject='Task created on contact creation';
            objT.Status='In progress';
            ObjT.CurrencyIsoCode=UserInfo.getDefaultCurrency();
            objT.whatId=objC.AccountId;
            lstTask.add(objT);
        }
        if(lstTask.size()>0)
        {
            insert lstTask;
        }
    }
}