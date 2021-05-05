public class JustForCheckHandle{

list<contact> lstcon{get;set;}

public list<contact> getdisplay()
{
lstcon=new list<contact>();
for(contact con:[select id,name,email from contact])
{
lstcon.add(con);
}
return lstcon;
}

}