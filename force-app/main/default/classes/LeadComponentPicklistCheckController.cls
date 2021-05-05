public without sharing class LeadComponentPicklistCheckController {
@AuraEnabled
    public static list<string> getPicklistValues(String objName,String field_apiname)
    {
        list<string> lstOption = new list<string>();
        Map<String,Schema.SObjectField> field_map = Schema.getGlobalDescribe().get(objName.toLowerCase()).getDescribe().fields.getMap();
        List<Schema.PicklistEntry> picklistValues = field_map.get(field_apiname).getDescribe().getPicklistValues();
        for(Schema.PicklistEntry ple: picklistValues)
        {
            lstOption.add(ple.getValue());
        }
        return lstOption;
    }
    @AuraEnabled
    public static lead createLeadMethod(Lead objlead){
        //objlead.Company ='test';
        objlead.Status ='Open - Not Contacted';
        objlead.CurrencyIsoCode = 'USD';
        insert objlead;
        return objlead;
    }
}