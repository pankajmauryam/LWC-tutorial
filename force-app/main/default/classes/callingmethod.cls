public with sharing class callingmethod {

    public void save() {
       login__c lg=new login__c(name='aarav12', password__c='1234');
       insert lg;
    }


}