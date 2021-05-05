public class MailingSystemController1 {
public list<Contact> lstcon{get;set;}
public boolean checkbox{get;set;}

   public MailingSystemController1 ()
   {
       DisplayRecord();
   }
    
     public list<Contact> DisplayRecord()
    {
        lstCon=new list<Contact>();
        for(contact objcon:[select id,name,email from contact  where Email!=null Limit 5])
      {
      
            lstCon.add(objcon);
            
          
        }
        //lstContact.addALl(lstCon);
        return lstCon;
    }
    
    public pageReference sendEmail()
    {
          
          list<Messaging.SingleEmailMessage> lstmails = new list<Messaging.SingleEmailMessage>();
        try
        {
             for(Contact cCon: lstCon) 
            {

            if(CheckBox== true)
              {

              Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[] { cCon.email,'pankajmauryam@gmail.com'};
                message.subject = 'Subject Test Message';
                message.plainTextBody = 'This is the message body.==='+cCon.name;
                lstmails.add(message);
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.Confirm,'mail has been sent'));
              }
            }

        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(lstmails);
        
       //lstCon.clear(); 
        return null;
        }
        catch(Exception e)
        {
        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.FATAL,'Something went wrong'));
        return null;
        }
      
     } 
}