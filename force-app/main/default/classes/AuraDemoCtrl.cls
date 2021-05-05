public with sharing class AuraDemoCtrl {
   @AuraEnabled
    public static Contact getContact() {
        return [select Id, Name from Contact Limit 1];
    }
    

}