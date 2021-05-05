@RestResource(urlMapping='/NewCase/*')
global without sharing class RestCaseApi {
    global class ResponseWrapper{
        public string Id;
        public boolean Error;
        public string Message;
        
        ResponseWrapper()
        {
            Id = '';
            Error = false;
            Message = '';
        }
    }
    global class RequestWrapper{
        public string TypeOfRequest;
        public string Name;
        public string Mobile;
        public string Email;
        RequestWrapper()
        {
            Name= '';
            Mobile = '';
            Email = '';
            TypeOfRequest = '';
        } 
    }
    @HttpGet
    global static ResponseWrapper doGet(){
        RestRequest request = RestContext.request;
        ResponseWrapper response = new ResponseWrapper();
        String mobileNo = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        list<Account> objAccount =[select id from Account where phone=: mobileNo];
        if(objAccount.size() <=0){
            return response;
        }
        response.Id = objAccount[0].Id;
        response.Error = false;
        response.Message = 'Account Record Fetched';
        return response;
    }
    @HttpPost
    global static ResponseWrapper CreateCase(RequestWrapper requestWrap)
    {
        ResponseWrapper response = new ResponseWrapper();
        system.debug('test--'+requestWrap);
         system.debug('test1--'+requestWrap.TypeOfRequest);
        try{
            if(requestWrap.TypeOfRequest == 'Self')
            {
                list<account> objAccount = [select id from account where Phone =: requestWrap.Mobile];
                
                Case objCase = new Case(SuppliedName = requestWrap.Name,
                                        SuppliedPhone = requestWrap.Mobile,
                                        SuppliedEmail = requestWrap.Email,
                                        AccountId = objAccount[0].Id!=null ? objAccount[0].Id : null );
                insert objCase;
                response.Id = objCase.Id;
                response.Error = false;
                response.Message = 'Case Inserted Successfully';
            }
        }catch(Exception Ex){
                //objCaseResponse.Mobile = caseRequests.MobileNo;
                response.Error = true;
                response.Message = Ex.getMessage();
            }
            return response;
        }
}