global class StudentSchedule implements schedulable {
    public void execute(schedulableContext sc)
    {
     list<messaging.singleEmailMessage> lstmails=new list<messaging.singleEmailMessage>();
        integer iday=system.today().day();
        integer imonth=system.today().month();
        for(Student__c st:[select id,Student_Name__c,email__c from student__c where day__c=:iday And month__c=:imonth And email__c!=null])
        {
           Messaging.singleEmailMessage msg=new Messaging.singleEmailMessage();
            msg.toAddresses=new String[] {st.email__c,'pankajmauryam@gmail.com'};
                msg.plainTextBody='Happy birthday bhai'+st.Student_Name__c+'Dhakkan :-)';
            msg.Subject='Birthday Special';
             lstmails.add(msg);
        }
       messaging.SendEmailResult[] snd=Messaging.SendEmail(lstmails);
    }

}