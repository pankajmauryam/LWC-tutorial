public class recordtypeController {
    public static map<id,string> mapofrecordtype{get;set;}
    @AuraEnabled
    public static list<String> fetchRecordValue()
    {
     list<schema.RecordTypeInfo> recordtype= contact.sObjectType.getDescribe().getRecordTypeInfos();
        mapofrecordtype = new map<id,string>();
        for(RecordTypeInfo rt:recordtype)
        {
            if(rt.getName() != 'Master')
            {
                mapofrecordtype.put(rt.getRecordTypeId(),rt.getName());
            }
        }
        return mapofrecordtype.values();
    }
    @AuraEnabled
    public static id getRecordId(String RecordTypeLabel)
    {
        Id recId = schema.sObjectType.Contact.getRecordTypeInfosByName().get(RecordTypeLabel).getRecordTypeId();
        return recId;
    }
}