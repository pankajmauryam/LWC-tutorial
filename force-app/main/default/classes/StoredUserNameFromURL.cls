public class StoredUserNameFromURL {
    public class UserName{
        public string username;
        public addresswrapper address;
        public companyWrapper company;
    }
    public class addresswrapper{
        public string street; 
    }
    public class companyWrapper{
        public string catchPhrase;
    }
    public static void parse()
    {
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://jsonplaceholder.typicode.com/users');
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        system.debug('response-->'+response.getBody());
        list<NewUser__c> lstNewUser = new list<NewUser__c>();
        list<UserName> lstUserName = (list<UserName>) JSON.deserialize(response.getBody(),list<UserName>.class);
         system.debug('lstUserName-->'+lstUserName);
        for(UserName user: lstUserName)
        {
            system.debug('test-->'+user.address.street);
            NewUser__c objNewUser = new NewUser__c();
            objNewUser.username__c = user.username;
            objNewUser.street__c = user.address.street;
           objNewUser.catchPhrase__c = user.company.catchPhrase; 
            lstNewUser.add(objNewUser);
        }
        insert lstNewUser; 
    }
}