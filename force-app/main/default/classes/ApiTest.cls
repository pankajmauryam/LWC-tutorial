@RestResource(urlMapping='/TestService/*')
global class ApiTest {
    private static final string INVALID_REQUEST = 'Invalid request';
    private static final string SUCCESS_MESSAGE = 'Success'; 
    private static final string NO_RECORD = 'No record found';
    
     @HttpPost
    global static ResponseWrapper doPost(){
        string jsonStr;
        RequestWrapper objRequestWraper = new RequestWrapper();
        
        try{
              if (RestContext.request.requestBody<>null){
                jsonStr= RestContext.request.requestBody.toString();
            }    
            objRequestWraper = (RequestWrapper)System.JSON.deserialize(jsonStr, RequestWrapper.class);
           // System.JSON.deserialize(EncodingUtil.base64Decode(jsonStr).toString(), RequestWrapper.class);
          // objRequestWraper=(RequestWrapper)System.JSON.deserialize(EncodingUtil.base64Decode(jsonStr).toString(), RequestWrapper.class);
            if(string.isNotBlank(jsonStr)){  
                //System.debug('entityId'+objRequestWraper.entityId);
                //System.debug('base64Data'+objRequestWraper.base64Data);
                //System.debug('fileName'+objRequestWraper.fileName);
                String base64Data=objRequestWraper.base64Data;
                //id test=FileController.saveTheFile('00Q2v00001UDtX8','Test.png',base64Data,'image/png;base64');
                id FileId=FileController.save('00Q6F00001CFeE7','Test.jpeg',base64Data,'image/png;base64');
                //System.debug('id---->'+FileId); 
                return new ResponseWrapper(true,SUCCESS_MESSAGE,FileId);
            }      
        }
        catch(Exception ex) {
            return new ResponseWrapper( false,ex.getMessage(),null);}
        
        return new ResponseWrapper( false,INVALID_REQUEST,null);
    }
    
    
    
    global class ResponseWrapper{
        public string message;
        public boolean isSuccess;
        public id fileId;
        public ResponseWrapper( boolean isSuccess ,string message,Id fileId){
            this.isSuccess =  isSuccess;
            this.fileId =  fileId;
            this.message = message;
        }
        public ResponseWrapper(){         
        }
    }
     public class RequestWrapper{
        public string entityId;
        public string base64Data;
        public string fileName;
    } 
}