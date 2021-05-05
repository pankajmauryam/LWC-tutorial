public class ImportDataFromJsonURL {
    public class NewUser{
      public string userId;
      public string id;
      public string title;
      public string body;
    }
    public void parse()
    {
        http h = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        
        system.debug('response-->'+response.getBody());
        list<NewUser__c> lstOfNewUserCreated = new list<NewUser__c>();
        list<NewUser> lstNewUser = (list<NewUser>) JSON.deserialize(response.getBody(),list<NewUser>.class);
        for(NewUser user : lstNewUser)
        {
            NewUser__c objNewUser = new NewUser__c();
            objNewUser.userId__c = user.userId;
            objNewUser.id__c = user.id;
            objNewUser.title__c = user.title;
            objNewUser.body__c = user.body;
            lstOfNewUserCreated.add(objNewUser);
        }
        insert lstOfNewUserCreated;
    }
}