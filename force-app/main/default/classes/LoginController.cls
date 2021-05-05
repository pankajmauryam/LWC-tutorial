public class LoginController {
public Signup__c sg;
    public LoginController(ApexPages.StandardController controller) {
sg=(Signup__c)Controller.getRecord();

    }
    public PageReference Login()
    {
     pagereference pg;
    for(Signup__c sign:[select user_name__c,Password__c from signup__c ])
    {
    if(sign.user_name__c==sg.user_name__c && sign.password__c==sg.password__c)
    {
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Access'));
     pg=new pageReference('/apex/Homepage');
     
    }
    }
   return pg;
    }

}