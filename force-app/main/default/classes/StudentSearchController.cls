public class StudentSearchController {
    @AuraEnabled
    public static list<sObject> getListOfSObject(String inputText)
    {
        list<sObject> query;
        if(inputText!= null)
        {
            String containtxt = '%'+inputText+'%';
            query = [select id,Name,Student_Name__c from student__c where Student_Name__c like : containtxt LIMIT 10];
        }else
        {
            query= [select id,Name,Student_Name__c from student__c LIMIT 10];
        }
        
        return query;
    }
    
}