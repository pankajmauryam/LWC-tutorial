public class HomepageController {
public signup__c sign{get;set;}
public list<signup__c> home{get;set;} 
public HomepageController()
{
home=[select id,name,last_name__c,country__c,mobile_no__c,user_name__c from signup__c];

}

}