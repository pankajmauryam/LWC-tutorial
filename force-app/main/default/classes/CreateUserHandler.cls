public class CreateUserHandler {
public void OnAfterInsert(list<contact> TN)
{
    //validateCreateUser(TN);
    createUser('amitmauryacold1@gmail.com','amcold','amitmauryacold1@gmail.com','coldmaurya1');
}
    void validateCreateUser(list<contact> TN)
    {
       String uname='amitmauryacold1@gmail.com',al='amcold',em='amitmauryacold1@gmail.com', lname='coldmaurya1';
        Profile p = [SELECT Id FROM Profile WHERE Name='New_Profile'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        
        User u = new User(alias = al, email=em,emailencodingkey='UTF-8', lastname=lname,languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,timezonesidkey='America/Los_Angeles',username=uname);
        insert u;
        
      /*  for(contact obj:[select id,firstname,lastname,email from contact where id IN:setConId])
        {
            if(obj.email!=null)
            {
                User objU=new User();
                objU.username=obj.Email;
                objU.email=obj.email;
            }
        }*/
    }
    @future
    public static void createUser( String uname,String al,String em,String lname)
    {
       Profile p = [SELECT Id FROM Profile WHERE Name='New_Profile'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
         
        User u = new User(alias = al, email=em, 
            emailencodingkey='UTF-8', lastname=lname, 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username=uname);
        insert u;  
    }
}