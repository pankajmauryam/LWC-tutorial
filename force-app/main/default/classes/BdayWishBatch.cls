global class BdayWishBatch implements Database.Batchable<sObject>
{
 
 public Database.queryLocator start(Database.BatchableContext bc2)
 {
    integer bMonth = system.Today().month();
    integer bDate  = system.Today().day(); 
  String query= 'select id,Name,email from Contact where months__c=:bMonth And days__c=:bDate And email!=null';
  return Database.getQueryLocator(query);
 }
    public void execute(Database.BatchableContext bc, List<Contact> conList)
{
             List<Messaging.SingleEmailMessage>  lstmail = new list<Messaging.SingleEmailMessage>();
       
     for(Contact Obj : conList)
     {
         Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
               message.toAddresses = new String[] { Obj.email,'pankajmauryam@gmail.com'};
                  message.subject = 'Special Day';
                     message.plainTextBody = 'Happy birthday ==='+Obj.Name+'Shiva'+' (:';
        
                    lstmail.add(message);
     }
    Messaging.SendEmailResult[] rs=Messaging.SendEmail(lstmail);
 }
    public void finish(Database.batchableContext bc)
 {
 }
}