public class MyDemoMailingHandler {
public list<WrapperStudent> lstcon{get;set;}
public MyDemoMailingHandler ()
{
DisplayStudent();
}
public list<wrapperStudent> DisplayStudent()
{
lstcon=new list<WrapperStudent>();
for(Student__c objS:[select id,Student_name__c,email__c from Student__c where email__c!=null limit 10])
{
lstCon.add(new WrapperStudent(objS));
}
return lstCon;
}

public pagereference sendmail()
{
list<Messaging.singleEmailMessage> lstmail=new list<Messaging.SingleEmailMessage>();
for(WrapperStudent ws:lstcon)
{
if(ws.checkbox==true)
{
Messaging.singleEmailMessage msg=new Messaging.singleEmailMessage();
msg.toaddresses=new string[] {ws.obj.email__c};
msg.plaintextBody='Hello sir'+ws.obj.Student_Name__c;
msg.subject='Important message';
lstmail.add(msg);
}
}
Messaging.SendEmailResult[] rs=Messaging.SendEmail(lstmail);  
return null;
}
public class WrapperStudent
{
public Student__c obj{get;set;}
public boolean Checkbox{get;set;}
public WrapperStudent(Student__c Sd)
{
obj=Sd;
checkbox=false;
} 
}
public pagereference clear()
{

return clear();
}


}