Global class BdayWishBatchStudent implements Database.Batchable<sObject> 
{
public Database.QueryLocator start(Database.BatchableContext bc)
{
    integer iday=system.today().day();
    integer imonth=system.today().month();
    String query='select id,Student_Name__c,email__c from student__c where Day__c=:iday And Month__c=:imonth And email__c!=null';
    return database.getQueryLocator(query);
}
public void execute(Database.batchableContext bc,list<student__c> lstcon)
{
    list<Messaging.SingleEmailMessage> lst=new List<messaging.SingleEmailMessage>();
    for(Student__c st:lstCon)
    {
    Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        msg.toAddresses=new String[] {st.email__c};
            msg.plaintextBody=' Happy Birthday Sir'+st.Student_name__c;
        msg.subject='This is Batch Testing';
        lst.add(msg);
    }
    Messaging.SendEmailResult[] result=Messaging.SendEmail(lst);
}
    public void finish(database.batchableContext bc)
    {
        
    }
}