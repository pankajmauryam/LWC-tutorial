public class reUsableMultiSelectLookupCtrl {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, List<sObject> ExcludeitemsList,String ContainFilter) {
        String searchKey = '%' + searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
        
        List<string> lstExcludeitems = new List<string>();
        for(sObject item : ExcludeitemsList ){
            lstExcludeitems.add(item.id);
        }
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 and exclude already selected records  
        String sQuery =  'select id, Name from ' +ObjectName + ' where  Name LIKE: searchKey AND Id NOT IN : lstExcludeitems order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        system.debug(returnList);
        return returnList;
    }
    @AuraEnabled
    public static string saveListOfRecords(string JSONString)
    {
       list<Account> lstAccount = new list<Account>();
        SYSTEM.debug('JSONString : ' + JSONString);
        list<String> lstId = (list<String>)JSON.deserializeUntyped(JSONString);
        if(lstId!=null && !lstId.isEmpty()){
            lstAccount = [select id,name from account where id IN: lstID];
        }
        return JSON.serialize(lstAccount); 
    }
}