public class AMSendSMSUtility
{   
    public static void ExecuteHTTPrequestToSendSMS(list<AM_SMS_History__c> lstHistory)
    {
        if(lstHistory != null && !lstHistory.isEmpty())
        {
            string Target_URL;
           list<AM_System_Configuration__mdt> lstSC = new list<AM_System_Configuration__mdt>([select SMS_End_Point_URL__c from AM_System_Configuration__mdt 
                                                                                                   where label='System Configuration Fld' limit 1]);
            
            if(!lstSC.isEmpty())
            {
                Target_URL = lstSC[0].SMS_End_Point_URL__c;
            } 
            string MobileNos = '';
            string smsText = '';
            
            HttpRequest req = new HttpRequest();
            req.setTimeout(60000);
            req.setMethod('GET');
            Http http = new Http();
            HttpResponse res = new HttpResponse();
            
            for(AM_SMS_History__c objSMSHistory : lstHistory)
            {
                if(objSMSHistory.SMS_Text__c != null && objSMSHistory.Mobile_Number__c != null)
                {
                    MobileNos = objSMSHistory.Mobile_Number__c;
                    smsText = objSMSHistory.SMS_Text__c +'\n'+ objSMSHistory.Case_Url__c;
                    string sender = string.isnotblank(objSMSHistory.SMS_Template__r.Short_Code__c)?objSMSHistory.SMS_Template__r.Short_Code__c:'MSILDL';                    
                    String encodedUrlMsg = EncodingUtil.urlEncode(smsText, 'UTF-8');
                    String url = TARGET_URL +'&PhoneNumber='+MobileNos+'&sender='+sender+'&text=' + encodedUrlMsg ; 
                    
                    req.setEndpoint(url);
                    
                    if(true)//test.isRunningTest() == true)
                    {
                        res.setHeader('Content-Type', 'application/json');
                        res.setBody('200-OK&errorcode=100');
                        res.setStatus('Ok');
                        res.setStatusCode(200);
                    }
                    else
                    {
                        //res = http.send(req);
                    }
                    objSMSHistory.SMS_Sent_Date_Time__c = system.now();
                    objSMSHistory.Response_Description__c = string.valueOf(res.getStatusCode()) + '-' + res.getStatus() 
                        + '&' + res.getBody();
                    
                    string strBody = res.getBody();
                    integer strstatuscode = res.getStatusCode();
                    integer errorcode ;
                    
                    system.debug('---strBody---'+strBody);
                    
                    if(strBody != null && strBody != '')
                    {
                        if(strBody.containsIgnoreCase('accepted') || strstatuscode ==200){
                            errorcode = 0;
                        }
                        else if(strBody.contains('errorcode')){
                            string[] arrErrorCode = strBody.split('&');                             
                            if(arrErrorCode != null && arrErrorCode.size() > 0){
                                for(string strMsg : arrErrorCode){
                                    if(strMsg.contains('errorcode')){
                                        string[] arrErrorCode1 = strMsg.split('=');                             
                                        if(arrErrorCode1 != null && arrErrorCode1.size() == 2){
                                            errorcode = arrErrorCode1[1] != null ? integer.valueOf(arrErrorCode1[1]) : null;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    system.debug('errorcode______ '+errorcode);
                    if(errorcode == 0){
                        objSMSHistory.Status__c = 'Delivered';
                        objSMSHistory.SMS_Sent__c = true;
                    }
                    else if(errorcode == 2){
                        objSMSHistory.Status__c = 'Pending';
                    }
                    else{
                        objSMSHistory.Status__c = 'Failed';
                    }                   
                }
            }
            if(!lstHistory.isEmpty())
                upsert lstHistory;
        }
    }   
    
    @future(callout = true)
    public static void ParseSMSHistoryJSON(String json)
    {
        list<AM_SMS_History__c> lstSMSHistory = (List<AM_SMS_History__c>)System.JSON.deserialize(json, List<AM_SMS_History__c>.class);
        AMSendSMSUtility.ExecuteHTTPrequestToSendSMS(lstSMSHistory);
    }
    
}