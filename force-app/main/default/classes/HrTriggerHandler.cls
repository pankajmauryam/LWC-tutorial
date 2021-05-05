public class HrTriggerHandler {
public void onBeforeInsert(list<HR_Details__c> objHr )
   {
    validateGood(objHr);
   }
    void validateGood(list<HR_Details__c > objHr)
    {
        for(HR_Details__c hr:objHr)
        {
        if(Hr.Good__c==false)
        {
            Hr.adderror('Plz select checkbox of good');
        }
        }
    }
}