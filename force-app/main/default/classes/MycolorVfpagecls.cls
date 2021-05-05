public class MycolorVfpagecls {
public list<account> Acc{get;set;}
public list<contact> Con{get;set;}

public MycolorVfpagecls ()
{
 Acc=[select id,name,dob__c,Rating,Industry,Phone from account];
Con=[select id,firstname,lastname,leadsource,mobilephone,email from contact];
}
}