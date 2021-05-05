public with sharing class StudentFirstLastEmailFetch {
    @AuraEnabled
    public static void getFirstLastEmailFetch(String FirstName,String LastName,String Email) {
try{
    Student__c std= new Student__c();
    std.Student_Name__c = FirstName;
    std.UserName__c = LastName;
    std.Email__c = Email;
    std.School__c = 'a006F000034JqZZQA0';
    insert std;
}catch(Exception ex){
    System.debug('An Exception: '+ex);
    

    } 
}
}
