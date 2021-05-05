public class MyCommonSelector {
   public List<AM_SMS_Template__c> getSMSTemplateByNameStatus(String templateName, boolean templateStatus){
        
        List<AM_SMS_Template__c> lstSMSTemplate= [select Id,
                                                  Template_Developer_Name__c,
                                                  SMS_Body__c,
                                                  Short_Code__c,
                                                  Active__c,
                                                  Case_Url__c FROM AM_SMS_Template__c where 
                                                  Template_Developer_Name__c =:templateName AND Active__c =: templateStatus];
        return lstSMSTemplate;
    }
}