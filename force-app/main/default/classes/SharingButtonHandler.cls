public  with sharing class SharingButtonHandler {

    public void save() {
       login__c lg=new login__c(name='moto5655',password__c='moto677');
        insert lg;
    }

}