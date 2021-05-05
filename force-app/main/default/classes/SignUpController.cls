public class SignUpController {
public signup__c sign{get;set;}

    public SignUpController() 
    {
    
    sign=new Signup__c();
    }



public void Register()
{
  if(sign.Name==null )
    {
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'First Name required'));
    
    }
   if(sign.last_name__c==null )
   {
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Last Name required'));
   
   }
   if(sign.country__c==null )
   {
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Select Any Country'));
   
   }
   if(sign.mobile_no__c==null )
   {
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Enter Mobile Number'));
    
   }
  if(sign.password__c==sign.confirm_password__c && (sign.name!=null && sign.last_name__c!=null && sign.country__c!=null && sign.mobile_no__c!=null))
   {
   insert sign;
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Successfully Registered Plz Login with your Registered Email'));
   }
   else
   {
   ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Fatal,'Password Does Not Match'));
   }
}

}