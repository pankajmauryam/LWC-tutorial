public class clsAccountExtension 
{
    public integer intAge{get;set;}
    Account objAcc;
    public clsAccountExtension(ApexPages.StandardController controller) {
        intAge = 0;
        
        objAcc = (Account)controller.getRecord();
    }
    
    public void calculateAge()
    {
        if(objAcc.DOB__c != null)
        {
            intAge = (system.today().year() - objAcc.DOB__c.year());
        }
    }

}