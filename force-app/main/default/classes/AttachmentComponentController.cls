public class AttachmentComponentController {
@AuraEnabled
    public static void updatePicturePath(String recId){
   
        ContentDocumentLink docLink = [ SELECT ContentDocumentId
                               FROM ContentDocumentLink
                               WHERE LinkedEntityId = :recId order by Id desc Limit 1];
       
		ContentVersion ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = :docLink.ContentDocumentId];
     
        Student__c student = [SELECT Id FROM Student__c WHERE Id = :recId];
        system.debug('ver.Id::::::'+ver.Id);
        student.Picture_Path__c = '/sfc/servlet.shepherd/version/download/'+ ver.Id;
        upsert student;
    }

}