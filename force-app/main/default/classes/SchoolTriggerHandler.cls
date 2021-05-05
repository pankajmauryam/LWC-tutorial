public class SchoolTriggerHandler {
    public void onBeforeInsert(list<School__c> SchoolTN)
    {
        validateEmail(SchoolTN);
    }
    void validateEmail(list<School__c> SchoolTN)
    {
        for(School__c sc:SchoolTN)
        {
            if(sc.Gmail__c == null)
            {
                sc.addError('plz enter gmail');
            }
        }
    }

}