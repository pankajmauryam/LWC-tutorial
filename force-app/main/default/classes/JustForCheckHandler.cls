public class JustForCheckHandler {


public list<contact> lstcon{get;set;}
public justForCheckHandler()
{
DisplayRecord();
}
    public void DisplayRecord() {
        lstcon=new list<contact>();
        for(contact con:[select id,name,email from contact limit 5])
        {
        lstcon.add(con);
        }
      
    }

}