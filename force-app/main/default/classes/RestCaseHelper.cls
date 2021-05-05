@RestResource(urlMapping='/Case/*')
global without sharing class RestCaseHelper {
    @HttpPost
    global static CaseResponse createCase(CaseRequest caseRequests ) {
        CaseResponse objCaseResponse = new CaseResponse();
        try
        {
            if(caseRequests == null)
            {
                objCaseResponse.IsError = true;
                objCaseResponse.Message = 'Please provide Record Details';
                return objCaseResponse;
            }
   
            if(!Pattern.matches('[0-9]{10}', caseRequests.MobileNo))
            {
                objCaseResponse.IsError = true;
                objCaseResponse.Message = 'Please enter 10 digit number';
                return objCaseResponse;
            }
            
            if(String.isBlank(caseRequests.Origin))
            {
                objCaseResponse.IsError = true;
                objCaseResponse.Message = 'Please enter Origin';
                return objCaseResponse;
            }
            
            Case objCase = new Case(Subject = 'Rest Api Records', Priority = 'Low', Status ='New',
                                    Mobile_Number__c = caseRequests.MobileNo,
                                    Origin = caseRequests.Origin);
            insert objCase;
            
            objCaseResponse.Id = objCase.Id;
            objCaseResponse.Mobile = caseRequests.MobileNo;
            objCaseResponse.IsError = false;
            objCaseResponse.Message = 'Success';
        }
        catch(Exception Ex){
            //objCaseResponse.Mobile = caseRequests.MobileNo;
            objCaseResponse.IsError = true;
            objCaseResponse.Message = Ex.getMessage();
        }
        return objCaseResponse;
        
    }
    
    global class CaseRequest  {
        public string MobileNo;
        public string Origin;
        
        public CaseRequest()
        {
            MobileNo = '';
            Origin = '';
        }
    }
    global class CaseResponse {
        public Id Id;
        public string Mobile;
        public string Message;
        public boolean IsError;
        
        public CaseResponse(){
            Id = null;
            Mobile = null;
            Message = null;
            IsError = false;
        }
    }
    
}