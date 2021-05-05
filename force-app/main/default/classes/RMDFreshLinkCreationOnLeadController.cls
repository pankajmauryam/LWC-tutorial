public class RMDFreshLinkCreationOnLeadController {
    @AuraEnabled
    public static id CreateFreshLink(id leadId,boolean sendPaymentlink)
    {
        String Url='https://subpay';
        RMD_Payment_Transaction__c objPT = new RMD_Payment_Transaction__c();
        lead objLead = [select id,RMD_Fresh_Payment_Link__c,RMD_Send_Payment_Link__c,MobilePhone from lead where id =: leadId ];
        if(sendPaymentlink)
        {
            objPT.RMD_Lead__c = objLead.id;
            insert objPT;
            objLead.RMD_Fresh_Payment_Link__c = Url + '/' + string.valueof(objLead.id).right(string.valueOf(objLead.id).length() -3) + 
                string.valueof(objPT.id).right(string.valueOf(objPT.id).length()-3) + 'fl' + objLead.MobilePhone;
            objLead.RMD_Send_Payment_Link__c = sendPaymentlink;
            update objLead;
        }
         return objPT.id;
    }
    
}