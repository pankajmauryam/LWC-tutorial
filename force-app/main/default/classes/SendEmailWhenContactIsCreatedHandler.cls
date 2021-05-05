public class SendEmailWhenContactIsCreatedHandler {
public void OnAfterInsert(list<contact> TN)
{
    validateContactEmail(TN);
}
    void ValidateContactEmail(list<contact> TN)
    {
    list< Messaging.SingleEmailMessage> lstmsg=new list<Messaging.SingleEmailMessage>();
        EmailTemplate templateId = [Select id from EmailTemplate where name='Shiva_template' limit 1];
        //OrgWideEmailAddress owa = [select id, DisplayName, Address from OrgWideEmailAddress limit 1];
		system.debug('templateId=='+templateId);
         List<Id> lstids= new List<Id>();
        for(contact con:TN) 
        {
             lstids.add(con.id);

            if(con.email!=null)
            {
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();  
                  msg.setTargetObjectId(con.id);
               msg.setSenderDisplayName('System Admin');
                msg.setTemplateId(templateId.id);
                lstmsg.add(msg);
            }
            Messaging.sendEmail(lstmsg);
        }
    }
}