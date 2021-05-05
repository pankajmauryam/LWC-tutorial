public class AccountCaseCreationController {
    @AuraEnabled
    public static list<Case> getName(String recordId)
    {
        return [select id,AccountId,Account.Name from Case where id=:recordId limit 1];
        
     }
   @AuraEnabled
    public static list<String> getSelectedStatus(){
       list<String> status = new list<String>();
        Schema.DescribeFieldResult fieldResult =
        case.status.getDescribe();
        List<Schema.PicklistEntry> statusField = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry pt : statusField)
        {
            status.add(pt.getValue());
        }       
        return status;
    }
    @AuraEnabled
    public static list<String> getSelectedOrigin()
    {
        list<string> origin= new list<string>();
        Schema.DescribeFieldResult fieldResult = case.origin.getDescribe();
        List<Schema.PicklistEntry> originField = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry ple: originField )
        {
            origin.add(ple.getValue());
        }
        return origin;
    }
}