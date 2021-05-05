public class clsNewContactList {
public list<selectOption> lstOption{get;set;}
public list<contact> lstCon{get;set;}
public string getSelectedOption{get;set;}
public boolean active{get;set;}

public clsNewContactList()
{
active=false;
lstCon = new list<contact>();
getSelectedOption='';
lstOption= new list<selectOption>();

lstOption.add(new selectOption('','---none---'));
for(Account acc:[select id,name from Account])
{
lstOption.add(new selectOption(acc.id,acc.name));
}
}
public void GetResult()
{
lstCon.clear();
active=false;
if(getSelectedOption !=null)
{

lstCon=[select id,name,email,phone from contact where accountid=:getSelectedOption];
   if(lstCon.size() > 0)
     {
                active= true;
     }
     else
     {
     ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.FATAL,system.label.select_account));
     }
}
else
{
ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.FATAL,system.label.select_account));
}
}
}