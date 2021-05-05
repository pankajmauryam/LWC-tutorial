public class AssignmentClass {
public  account acc;

    public AssignmentClass(ApexPages.StandardController controller) {
acc=(Account)Controller.getRecord();
  
 }
  public void finance12()
  {
   
   list<CustomAccount__c> obj=CustomAccount__c.getAll().values();
   
   if(acc.Financial_year__c == obj[0].Financial_year__c)
      {
    insert acc;
    
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Data Saved Successfully'));
       }
   }
   public void save()
   {
   }
   
  /*  catch(exception ex)
     {
    return null;
     }*/
    

}