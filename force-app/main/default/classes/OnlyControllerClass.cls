public class OnlyControllerClass {
public integer intage{get;set;}
public Account objAcc{get;set;}
public OnlyControllerClass()
{
intage=0;
objAcc=new Account();
}
public pageReference save()
{
try
{
insert objAcc;
//objAcc=new Account();
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Data Saved Successfully'));
     pagereference objP = new pagereference('/'+objAcc.id);
            return objP;
}
catch(Exception e)
{
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,e.getMessage()));
return null;
}
}
public pageReference cancel()
{
  pagereference objP = new pagereference('/001/o');
        return objP;
}

public void calculateAge() 
{
intAge=Date.today().year()-objAcc.dob__c.year();
}
}