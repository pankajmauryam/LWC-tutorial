public class BCCLHelperSMSHistory {
    public static void CreateCsvFile()
    {
        list<task> createTask= new list<task>();
        list<string> lstCsv =new list<string>();
        //Integer addDays = Integer.valueOf(label.ArchiveDate);
       // DateTime newDate = DateTime.Now().AddDays(-addDays);
    
       // Date d= system.Today().addDays(1);
       // system.debug('Date++++'+d);
        integer count=0;
        list<AM_SMS_History__c> lstSmsHistoryquery=[select id,Name,Mobile_Number__c,Status__c,SMS_Text__c,CreatedDate from AM_SMS_History__c where CreatedDate <=: Increment_Date__c.getall().values().Archive_Date__c];

        String csv = ' \'smsHistoryHeader\' ';
        for ( AM_SMS_History__c objSMS : lstSmsHistoryquery )
        {          
            csv += objSMS.id + ',' + objSMS.name.escapeCsv() + ',' + objSMS.Mobile_Number__c + ',' + objSMS.Status__c + ','+ objSMS.CreatedDate + ',' ;
            Blob beforeblob = Blob.valueOf(objSMS.SMS_Text__c);
            string paramvalue = EncodingUtil.base64Encode(beforeblob);
            csv+= paramvalue + '\n';
           // csv+= objSMS.SMS_Text__c+',' +'\n';
             count++;                          
         }
      if(count >0)
     {
   
        ContentVersion file = new ContentVersion
        (
            title = 'SMSHistoryToday.csv',
            versionData = Blob.valueOf(csv),
            pathOnClient = '/SMSHistoryToday.csv'
        );
                                             
                                             insert file;
                                             System.debug( '&&&'+file );
                                             Contentversion cdl = [SELECT id,ContentDocumentId FROM Contentversion WHERE Id =:file.id Limit 1];
                                             ContentDocumentLink cd = new ContentDocumentLink(ContentDocumentId =cdl.ContentDocumentId, LinkedEntityId = '0056F000009dckSQAQ' , ShareType = 'V');
                                             insert(cd);
                                             Integer addDay=1;
                                             Increment_Date__c IncDate = Increment_Date__c.getall().values();    
                                             IncDate.Archive_Date__c = IncDate.Archive_Date__c.addDays(addDay);
                                             system.debug('&&='+IncDate.Archive_Date__c); 
                                             update IncDate;
                                            /* ContentWorkspace ws = [SELECT Id, RootContentFolderId FROM ContentWorkspace WHERE Name = 'Archive Data' LIMIT 1];  
                                            ContentFolderMember cfm = [SELECT Id, ChildRecordId, ParentContentFolderId
                                                                        FROM ContentFolderMember
                                                                        WHERE ChildRecordId = :cdl.ContentDocumentId
                                                                        LIMIT 1];
                                            // contentFolder conF = [SELECT id,name,ParentContentFolderId FROM ContentFolder where name='Not Processed'  LIMIT 1 ];
                                            ContentFolderMember updatedCfm = new ContentFolderMember(Id = cfm.Id,
                                                                                                      ChildRecordId = cdl.ContentDocumentId,
                                                                                                      ParentContentFolderId = cfm.ParentContentFolderId);
                                              //contentFolder conF = [SELECT id,name,ParentContentFolderId FROM ContentFolder where name='Not Processed'  LIMIT 1 ];
                                             //ContentWorkspaceDoc cdc = new ContentWorkspaceDoc(ContentDocumentId = cdl.ContentDocumentId,ContentWorkspaceId = conF.id);
                                             
                                             update updatedCfm;*/
                                         }
                                                                                  
                                         //delete lstSmsHistoryquery;
                                         
                                         }
                                         
                                         }