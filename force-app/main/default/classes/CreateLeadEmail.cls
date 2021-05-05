global class CreateLeadEmail implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
//system.debug('testing=='+email.plainTextBody);
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

            Lead l= new lead();
            l.LastName = email.fromname;
            l.company='Gunnu industry';
            l.status='Open-Not Contacted';
            l.Email='Gunnu@gmail.com';
            l.mobilePhone='9889898989';
            insert l;
            account acc=new Account();
            acc.name=l.company;
            acc.rating='hot';
            insert acc;
            contact con=new contact();
            con.lastname=l.lastname;
            con.F_y__c='2016-17';
            insert con;
opportunity op=new opportunity();
op.name=l.company;
op.CloseDate=date.parse('06-07-2018');
op.StageName='Prospecting';
insert op;
        result.success = true;
        return result;
    }
    
    
}