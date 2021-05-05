public with sharing class MyClassSfdx {
    public static List<Account> getAllActiveAccounts() {
      integer a=10;
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }
}