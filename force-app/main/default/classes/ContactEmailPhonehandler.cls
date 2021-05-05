public class ContactEmailPhonehandler {
public void OnBeforeInsert(list<contact> TN)
{
validateContact(TN);
    
}
    void validateContact(list<contact> TN)
    {
        Set<String> setPhone=new set<string>();
        Set<string> setEmail=new set<string>();
        for(contact con:TN)
        {
          setPhone.add(con.Phone);
            setEmail.add(con.Email);
        }
        map<string,contact> mpP=new map<string,contact>();
         map<string,contact> mpE=new map<string,contact>();
        for(contact con:[select id,phone,email from contact where Phone IN:setPhone OR Email IN:setEmail])
        {
         mpP.put(con.Phone,con);
            mpE.put(con.Email,con);
        }
        for(contact con:TN)
        {
            if(mpP.ContainsKey(con.Phone))
            {
             con.Phone.addError('Phone already exist') ;   
            }
            if(mpE.ContainsKey(con.Email))
            {
             con.Email.addError('Email already exist') ;   
            }
        }
    }
}