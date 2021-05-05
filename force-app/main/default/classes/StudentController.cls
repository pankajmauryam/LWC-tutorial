public class StudentController {
    @AuraEnabled
public static student__c save(Student__c std)
{
    insert std;
    return std;
}
}