public class FileController {
    public static Id save(Id parentId, String fileName, String base64Data, String contentType) { 
         ContentVersion contentVersion = new ContentVersion();
        contentVersion.ContentLocation = 'S'; // S = Stored in Salesforce
        contentVersion.PathOnClient = fileName;
            contentVersion.Title = fileName;
            contentVersion.VersionData = EncodingUtil.base64Decode(base64Data);
        insert contentVersion;
   
              
 //assign to lead id/Account id
        Contentversion cdl = [SELECT id,ContentDocumentId FROM Contentversion WHERE Id =:contentVersion.Id Limit 1];
        ContentDocumentLink cd = new ContentDocumentLink(ContentDocumentId =cdl.ContentDocumentId, LinkedEntityId =parentId,ShareType = 'V');
        insert cd;
        
         return contentVersion.id;
    }
}