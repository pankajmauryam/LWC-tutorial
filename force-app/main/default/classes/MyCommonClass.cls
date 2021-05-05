public class MyCommonClass {
   @AuraEnabled
    public static Integer sendOTP(list<string> mobileNumber){
		List<AM_SMS_History__c> lstSMSHistory = new List<AM_SMS_History__c>();
        
        // 6 Digit OTP Generation
        Integer codeLength = 6;
        String str = string.valueof(Math.abs(Crypto.getRandomLong()));
        String randomNumber = str.substring(0, codeLength);
        
        //Inserting the History Object with the template and sms text 
        AM_SMS_History__c objSMSHistory = new AM_SMS_History__c();
        List<AM_SMS_Template__c> lstSMSTemplate = new MyCommonSelector().getSMSTemplateByNameStatus('testdev',true); 
        
        objSMSHistory.SMS_Template__c = lstSMSTemplate[0].Id;
        objSMSHistory.SMS_Text__c = lstSMSTemplate[0].SMS_Body__c.replaceAll('<OTP>',randomNumber);
        objSMSHistory.Mobile_Number__c = string.valueOf(mobileNumber);
        
        lstSMSHistory.add(objSMSHistory);
        // Sending the OTP.
        try{
        	AMSendSMSUtility.ExecuteHTTPrequestToSendSMS(lstSMSHistory);    
        }
        catch(Exception ex){
       		//MyCommonClass.setExceptionLogDetails(ex,'Send OTP in MSILCommon','Sahil Sharma');
        }
        return integer.valueOf(randomNumber);
    }
    
    public static boolean isTriggerActive(String triggername)
    {
        map<string,trigger_switch__c> mapOfAction = trigger_switch__c.getall();
        boolean isTriggeractive = false;
        for(String tname:mapOfAction.keySet())
        {
            if(tname.equalsIgnoreCase(triggername) && mapOfAction.get(tname).isActive__c)
            {
                isTriggeractive =true;
                break;
            }
        }
        return isTriggeractive;
    }
}