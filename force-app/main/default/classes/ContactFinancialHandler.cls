public class ContactFinancialHandler {
    public void OnBeforeInsert(List<contact> TN)
    {
        validateContactInsert(TN);
    }
void validateContactInsert(List<contact> TN)
{
  set<String> setFy=new set<string>();
    for(Financial_year__c obj:[select F_Y__c from Financial_year__c])
    {
       setFy.add(obj.F_Y__c); 
    }
    for(contact objC:TN)
    {
        if(setFy.contains(objC.F_Y__c)==false)
        {
            objC.addError('plz create Financial record in financial year object');
        }
    }
}
}