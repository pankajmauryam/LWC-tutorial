public class MyContactListComponentClass {
    @AuraEnabled
public static list<contact> getContacts()
{
    return [select id,name,email from contact Limit 10];
}
}