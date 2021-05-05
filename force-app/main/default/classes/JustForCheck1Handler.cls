public class JustForCheck1Handler {
public list<contact> lstcon{get;set;}
public JustForCheck1Handler ()
{
display();
}
public list<contact> display()
{
lstcon=new list<contact>();
for(contact con:[select id,name from contact])
{
lstcon.add(con);
}
return lstcon;
}
}