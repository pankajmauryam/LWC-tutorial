public class MailingSystemController {

public list<DumyContact> lstcon{get;set;}
   public MailingSystemController ()
   {
       DisplayRecord();
   }
    
     public list<DumyContact> DisplayRecord()
    {
        lstCon=new list<DumyContact>();
        for(contact objcon:[select id,name,email from contact  where Email!=null Limit 5])
      {
            lstCon.add(new DumyContact(objcon));
          
        }
        //lstContact.addALl(lstCon);
        return lstCon;
    }
    
    public pageReference sendEmail()
    {
          
          list<Messaging.SingleEmailMessage> lstmails = new list<Messaging.SingleEmailMessage>();
        try
        {
             for(DumyContact cCon: lstCon) 
            {

            if(cCon.checkbox == true)
              {

              Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[] { cCon.obj.email};
                message.subject = 'Subject Test Message';
                message.plainTextBody = 'This is the message body.==='+cCon.obj.name;
                lstmails.add(message);
              }
            }

        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(lstmails);
        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.Confirm,'mail has been sent'));
       //lstCon.clear(); 
        return null;
        }
        catch(Exception e)
        {
        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.FATAL,'Something went wrong'));
        return null;
        }
      
     }

        
    
    
    public class DumyContact
    {
       public boolean checkbox{get;set;}
       public contact obj{get;set;}
       public DumyContact(contact objcon)
       {
      
       obj=objcon;
       checkbox=false;
       }
    }
   }