public class OpportunityListController {
@AuraEnabled
    public static list<opportunity> getListOfOpportunity()
    {
        return [select id,Name,AccountId from opportunity limit 5];
    }
}