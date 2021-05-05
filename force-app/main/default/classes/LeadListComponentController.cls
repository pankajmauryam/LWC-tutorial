public class LeadListComponentController {
    @AuraEnabled
    public static lead getLeadInfo(string recordId)
    {
        return [select id,Name,Company,status from lead where id=:recordId]; 
    }
    @AuraEnabled
    public static lead updatingName(String leadname,String recordId)
    {
        lead ld = new lead();
        ld.id = recordId;
        ld.lastName = leadname;
        update ld;  
        return ld;
    }
    @AuraEnabled
    public static list<lead> getLead(String txtName)
    {
        string searchText = '%'+ txtName + '%';
        return [select id,Name,Phone from lead where LastName like : searchText LIMIT 10];
    }
}