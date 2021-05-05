public class MyContactVF9septClass {
public list<selectOption> lstSelOptCon{get;set;}
public string selectedcontact{get;set;}
public list<opportunity> displayOpp{get;set;}

public MyContactVF9septClass()
{
lstSelOptCon = new list<selectOption>();
lstSelOptCon.add(new selectOption('','--none--'));
displayOpp=new list<Opportunity>();
for(contact con:[select id,name from contact])
{
lstSelOptCon.add(new selectOption(con.id,con.name));
}
}
public void GetResult()
{
if(selectedcontact != null)
{
displayOpp=[select id,name,stagename,amount from opportunity where contact__r.id=:selectedcontact];
}
}
 
}