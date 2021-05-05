public without sharing class ContactListController {
        
    @AuraEnabled
    public static List<Contact> getContactList(List<Id> accountIds) {
        // Getting the list of contacts from where Id is in accountIds
                List<Contact> contactList = [SELECT Id, Name, Email, Phone, AccountId FROM Contact WHERE AccountId in :accountIds];
                // Returning the contact list
        return contactList;
    }
    @AuraEnabled
    public static list<contact> getListOfContact(Id accountId)
    {
        return [select id,name,LastName,Phone from contact where phone!=null and accountId =:accountId];
    }
    @AuraEnabled
    public static List<String> getPicklistValues(String objectName, String field_apiname){
        List<String> optionlist = new List<String>();   
        Map<String, Schema.SObjectField> field_map = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().fields.getMap();        
        List<Schema.PicklistEntry> picklistValues = field_map.get(field_apiname).getDescribe().getPickListValues();       
       system.debug('values0'+picklistValues);
        for (Schema.PicklistEntry pv : picklistValues) {
                system.debug('pv-->'+pv.getValue());
            optionlist.add(pv.getValue());
        }
        return optionlist;
    } 
    @AuraEnabled
    public static contact createContactRecord(Contact con,String accountId){
        con.AccountId = accountId;
        con.F_Y__c ='2016-17';
        insert con;
        return con;
    }
}