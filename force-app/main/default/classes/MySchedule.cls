Global class MySchedule implements schedulable
{
    
 public void execute(schedulableContext Sc)
{
     list<Messaging.SingleEmailMessage> lstmails = new list<Messaging.SingleEmailMessage>();
    integer imonth=system.Today().month();
     integer iday=system.Today().Day();
    for(contact objCon:[select id,name,email from contact where months__c=:imonth And days__c=:iday And email!=null])
    {
        
     Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[] { ObjCon.email};
                message.subject = 'Special Day';
                message.plainTextBody = 'Happy birthday ==='+Objcon.Name+'Bhai'+' (:';
        
                lstmails.add(message);
    }
     Messaging.SendEmailResult[] results = Messaging.sendEmail(lstmails);
}
}