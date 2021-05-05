public class MyCommon {
 /*  public static Map<String,Schema.SObjectType> mapOfObjectNameToSObjectType = Schema.getGlobalDescribe();
    public static Map<ID, Schema.RecordTypeInfo> mapOfObjectRecordTypeIdToName;
    public static Map<ID, Schema.RecordTypeInfo> mapOfObjectRecordTypeNameToId;
  */  
    /* This method is will return the record type name when below information is provided:
* 1. Object API Name
* 2. Record Type Id
-------------------------------------------------------------------------------------------------------------------------
Version#     Date                           Author                    Description
-------------------------------------------------------------------------------------------------------------------------
1.0          3-January-2019             Amit Gayal              Initial Version  
--------------------------------------------------------------------------------------------------------------------------
*/
   /* public static String getRecordTypeNameFromRecordTypeId(String objectAPIName, String recordTypeId){
        String recordTypeName = '';
        if(String.isNotBlank(objectAPIName) && String.isNotBlank(recordTypeId)){
            
            if(mapOfObjectNameToSObjectType != NULL 
               && mapOfObjectNameToSObjectType.containsKey(objectAPIName)
               && mapOfObjectNameToSObjectType.get(objectAPIName) != NULL){
                   
                   mapOfObjectRecordTypeIdToName = mapOfObjectNameToSObjectType.get(objectAPIName).getDescribe().getRecordTypeInfosById();
                   
                   if(mapOfObjectRecordTypeIdToName != NULL 
                      && mapOfObjectRecordTypeIdToName.containsKey(recordTypeId)
                      && mapOfObjectRecordTypeIdToName.get(recordTypeId) != NULL){
                          recordTypeName = mapOfObjectRecordTypeIdToName.get(recordTypeId).getName();
                      }
               }
        }
        return recordTypeName;
    }  */
    
    /* This method is will return the profile Id for profile 'Partner Community User'
-------------------------------------------------------------------------------------------------------------------------
Version#     Date                           Author                    Description
-------------------------------------------------------------------------------------------------------------------------
1.0          3-January-2019             Amit Gayal              Initial Version  
--------------------------------------------------------------------------------------------------------------------------
*/
 /*   public static String defaultPartnerUserProfileId(){
        return getProfileIdFromProfilName(MSILConstant.USER_PROFILE_DEALERUSER);
    } */
    
    /* This method is will return the profile Id for profile 'Standard User'
-------------------------------------------------------------------------------------------------------------------------
Version#     Date                           Author                    Description
-------------------------------------------------------------------------------------------------------------------------
1.0          3-January-2019             Amit Gayal              Initial Version  
--------------------------------------------------------------------------------------------------------------------------
*/    
   /* public static String defaultUserProfileId(){
        return getProfileIdFromProfilName(MSILConstant.USER_PROFILE_STANDARD);
    } */
    
    /* This method is will return the profile Id of profile name provided as parameter else 'blank' value
-------------------------------------------------------------------------------------------------------------------------
Version#     Date                           Author                    Description
-------------------------------------------------------------------------------------------------------------------------
1.0          3-January-2019             Amit Gayal              Initial Version  
--------------------------------------------------------------------------------------------------------------------------
*/    
  /*  private static String getProfileIdFromProfilName(String profileName){
        String profileId = '';
        if(String.isNotBlank(profileName)){
            try{
                List<Profile> lstProfile = [SELECT Id FROM Profile WHERE Name =: profileName];
                if(lstProfile != NULL && !lstProfile.isEmpty()){
                    profileId = lstProfile[0].Id;
                }
            }
            catch(Exception ex){
                system.debug('Exception occurred: '+ex.getStackTraceString());
            }
        }
        system.debug('Profile Id is :'+profileId);
        return profileId;
    } */
    
    /*
@author: Dheeraj Pandey
@company: SaaSfocus
@description: Method is used to insert Exception log to track in future
@Example : MSILCommon.setExceptionLogDetails(ex,'Enquiry Creation', 'Dheeraj Pandey');
*/ 
    
 /*   public static void setExceptionLogDetails(Exception ex, String strModuleName, String strDeveloperName){
        MSIL_Errors_and_Exceptions__c objExceptionLog = new MSIL_Errors_and_Exceptions__c();
        objExceptionLog.MSIL_Class_Name__c = getClassName(ex.getStackTraceString());
        objExceptionLog.MSIL_Developer_Name__c = strDeveloperName;
        objExceptionLog.MSIL_Exception_Body__c = 'CAUSE =:>
 '+ex.getCause()+'\n*********************\nLINE Number =:>
 '
            +ex.getLineNumber()+'\n*********************\nMessage =:>
 '+ex.getMessage()+'\n*********************\nStack Trace =:>
 '
            +ex.getStackTraceString()+'\n*********************\nException Type =:>
 '+ex.getTypeName(); 
        objExceptionLog.MSIL_Exception_Type__c = ex.getTypeName();
        objExceptionLog.MSIL_Exception_Message__c = ex.getMessage();
        objExceptionLog.MSIL_Module_Name__c = strModuleName;   
        insert objExceptionLog;
    }
    
    public static String getClassName(String line){
        if (line.startsWith('Class.')){
            line = line.substringAfter('Class.');
        }
        return line.substringBefore(':').substringBeforeLast('.');
    }  */   
    
    /*
@author: Sahil Sharma1
@company: SaaSfocus
@description: This method receives SObject and Signature JSON received from MSILDigitalSignature and attach the signature as 
image under the SObject.
*/
  /*  public static void InsertDocument(SObject objName, String blobData){
        ContentVersion objectContentVersion = new ContentVersion();
        objectContentVersion.ContentLocation = 'S';
        String recordName = String.valueOf(objName.get('Name'));
        objectContentVersion.PathOnClient = recordName + '.jpg';
        objectContentVersion.Title = recordName;
        objectContentVersion.VersionData = EncodingUtil.base64Decode(blobData);
        insert objectContentVersion;
        attachContentDocument(objName,new List<Id>{objectContentVersion.Id});
    } */
    
/*
@author: Amit Gayal
@company: SaaSfocus
@description: This method receives SObject and ContentDocumentId received and attaches the file under the SObject record provided.
*/
 /*   public static void attachContentDocument(SObject sobjectRecord, List<Id> lstContentDocumentId){
        List<ContentDocumentLink> lstContentDocumentLink = new List<ContentDocumentLink>();
        
        if(lstContentDocumentId != NULL && !lstContentDocumentId.isEmpty() && sobjectRecord != NULL && sobjectRecord.get('Id') != NULL){
            Map<Id,ContentVersion> mapConVerObj = new Map<Id,ContentVersion>([SELECT Id, ContentDocumentId
                                                                             FROM ContentVersion
                                                                             WHERE Id IN: lstContentDocumentId]);
            if(mapConVerObj != NULL && !mapConVerObj.isEmpty()){
                
                for(Id eachId : mapConVerObj.keySet()){
                    ContentDocumentLink objectContentDocumentLink = new ContentDocumentLink();
                    if(mapConVerObj.containsKey(eachId) && mapConVerObj.get(eachId) != NULL){
                        objectContentDocumentLink.ContentDocumentId = mapConVerObj.get(eachId).ContentDocumentId;
                        objectContentDocumentLink.linkedEntityId = String.valueOf(sobjectRecord.get('Id'));
                        objectContentDocumentLink.ShareType='I';
                        lstContentDocumentLink.add(objectContentDocumentLink);
                    }
                    else{
                        system.debug('Invalid ContentDocumentId was provided.');
                    }
                }
            }
            try{
                if(!lstContentDocumentLink.isEmpty()){
                    insert lstContentDocumentLink;
                }
                system.debug('The content document was attached successfully.');
            }
            catch(Exception ex){
                MSILCommon.setExceptionLogDetails(ex,'Lead Pre-booking','Amit Gayal');
            }
        }
        else{
            system.debug('Invalid ContentDocumentId Or SObjectRecord OR SObjectRecordId was provided.');
        }
    }  */

/*
@author: Amit Gayal
@company: SaaSfocus
@description: This method receives SObject name and Field-set name as input and returns the list of API names of fields in input field set.
*/    
/*    public static List<String> getListOfFieldsFromSObjectFieldSet(String SObjectName, String FieldSetAPIName){
        List<String> listOfFields;
        
        if(String.isNotBlank(SObjectName) && String.isNotBlank(FieldSetAPIName)){
            Map<String,Schema.FieldSet> mapOfFieldSetNameToFieldSet = mapOfObjectNameToSObjectType.get(SObjectName).getDescribe().fieldSets.getMap();
            listOfFields = new List<String>();
            
            if(mapOfFieldSetNameToFieldSet != NULL &&
               mapOfFieldSetNameToFieldSet.containsKey(FieldSetAPIName) &&
               mapOfFieldSetNameToFieldSet.get(FieldSetAPIName) != NULL){
                   
                   List<Schema.FieldSetMember> listOfFieldSetMembers = mapOfFieldSetNameToFieldSet.get(FieldSetAPIName).getFields();
                   if(listOfFieldSetMembers != NULL && !listOfFieldSetMembers.isEmpty()){
                       for(Schema.FieldSetMember eachFieldSetMember : listOfFieldSetMembers){
                           listOfFields.add(String.valueOf(eachFieldSetMember.fieldpath));
                       }
                   }
               }
        }
        return listOfFields;
    } */

/*
@author: Amit Gayal
@company: SaaSfocus
@description: This method identifies the SObject Type of the input Id and then return the name of SObject as string.
*/    
 /*   public static String getSObjectNameFromId(String inputId){
        if(inputId != NULL && inputId instanceOf Id){
            return String.valueOf(Id.valueOf(inputId).getSObjectType());
        }
        return NULL;
    }  */
    
/*
@author: Amit Gayal
@company: SaaSfocus
description: This method identifies the SObject Type of the input SET and then return the name of SObject as string.
*/    
 /*   public static String getSObjectNameFromCollection(Set<SObject> inputCollection){
        return getSObjectNameFromCollection(new List<SObject>(inputCollection));
    } */
    
/*
@author: Amit Gayal
@company: SaaSfocus
description: This method identifies the SObject Type of the input LIST and then return the name of SObject as string.
*/    
 /*   public static String getSObjectNameFromCollection(List<SObject> inputCollection){
        if(inputCollection != NULL){
            return String.valueOf(inputCollection.getSObjectType());
        }
        return NULL;
    }  
    
     public class EmailWrapper{
        public String emailBody = '';
        public String plainTextBody = '';
        public List<String> ccAdd = new list<string>();
        public List<String> toAdd = new list<string>();
        public string templateId = '';
        public String subject ='';
        public EmailWrapper(){}
        public EmailWrapper(String body, List<String> toList, List<String> ccList, String sub, string tempId, string textbody){
            this.emailBody=body;
            this.ccAdd=ccList;
            this.toAdd=toList;
            this.subject=sub;
            this.templateId=tempId;
            this.plainTextBody=textbody;
        }
    }
        
        public static void sendEmail(List<EmailWrapper> emailWrapperList){
        system.debug('[[AG]]^ : MSILCommon > sendEmail : Starting');
        list<Messaging.SingleEmailMessage> lstmail = new list<Messaging.SingleEmailMessage>();
        for(EmailWrapper em: emailWrapperList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToaddresses(em.toAdd);
            mail.setCcAddresses(em.ccAdd);
            mail.setSubject(em.subject);
            mail.setHTMLBody(em.emailBody);
            if(em.toAdd != NULL && !em.toAdd.isEmpty()){
                lstmail.add(mail)
;
            }
        }
        system.debug('[[AG]]^ : MSILCommon > lstmail '+lstmail);
        if(!lstmail.isEmpty())
        {
            system.debug('In@@@@@'+lstmail);
            Messaging.sendEmail(lstmail);
        }
        system.debug('[[AG]]^ : MSILCommon > sendEmail : Exiting');
    } */
    
    /**
@author: Sahil Sharma1
@company: Saasfocus
@description: This method is used to send unique 6 digit One Time Password (OTP) to the mobile number passed to this method.
*/
 /*   @AuraEnabled
    public static Integer sendOTP(String mobileNumber){
        List<MSIL_SMS_History__c> lstSMSHistory = new List<MSIL_SMS_History__c>();
        
        // 6 Digit OTP Generation
        Integer codeLength = 6;
        String str = string.valueof(Math.abs(Crypto.getRandomLong()));
        String randomNumber = str.substring(0, codeLength);
        
        //Inserting the History Object with the template and sms text 
        MSIL_SMS_History__c objSMSHistory = new MSIL_SMS_History__c();
        List<MSIL_SMS_Template__c> lstSMSTemplate = new MSILCommonSelector().getSMSTemplateByNameStatus('MSIL_OTP_To_Customer',true); 
        
        objSMSHistory.MSIL_SMS_Template__c = lstSMSTemplate[0].Id;
        objSMSHistory.MSIL_SMS_Text__c = lstSMSTemplate[0].MSIL_SMS_Body__c.replaceAll('<OTP>',randomNumber);
        objSMSHistory.MSIL_Mobile_Number__c = mobileNumber;
        
        lstSMSHistory.add(objSMSHistory);
        // Sending the OTP.
        try{
            MSILSendSMSUtility.ExecuteHTTPrequestToSendSMS(lstSMSHistory);    
        }
        catch(Exception ex){
            MSILCommon.setExceptionLogDetails(ex,'Send OTP in MSILCommon','Sahil Sharma');
        }
        return integer.valueOf(randomNumber);
    }
    */
    
     public static id getRecordTypeId(string objectAPIName, string recordTypeName)
    {
        if(string.isEmpty(objectAPIName) || string.isEmpty(recordTypeName)){
            return null;
        }
        //Get schema information
        Id recordTypeId;
        Map<String, Schema.SObjectType> globalDescription =  Schema.getGlobalDescribe();
        Schema.SObjectType sObjType = globalDescription.get(objectAPIName);  
        Schema.DescribeSObjectResult cfrSchema = sObjType.getDescribe();
        Map<String,Schema.RecordTypeInfo> RecordTypeInfo = cfrSchema.getRecordTypeInfosByName();
        if(RecordTypeInfo.get(recordTypeName) != null)
            recordTypeId = RecordTypeInfo.get(recordTypeName).getRecordTypeId();
        return recordTypeId;
    }
}