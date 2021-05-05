public class AssignmentClass2 {
public  account acc;

    public AssignmentClass2(ApexPages.StandardController controller) {
     acc=new Account();
    acc=(Account)Controller.getRecord();
  
 }
  public void finance12()
  {
 
   list<CustomAccount__c> obj=CustomAccount__c.getAll().values();
   
   try
   {
   if(acc.Financial_year__c == obj[0].Financial_year__c)
      {
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Data Matched Successfully'));
       }
       else
       {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Data in Financial field is wrong'));
       }
    } 
    catch(Exception e)
    {
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Plz try again'));
    } 
   } 
   
   public void save()
  {
   list<CustomAccount__c> obj=CustomAccount__c.getAll().values();
   try
   {
   if(acc.Financial_year__c == obj[0].Financial_year__c)
      {
    insert acc;
    
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Data Saved Successfully'));
       }
       else
       {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Data does not match'));
       }
    } 
    catch(Exception e)
    {
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Plz try again'));
    } 
   } 

}