global class NewCreateLeadEmail implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
//system.debug('testing=='+email.plainTextBody);
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

            Lead l= new lead();
            l.LastName = email.fromname;
            l.company='Gillu industry';
            l.status='Open-Not Contacted';
            l.Email='Gillu@gmail.com';
            l.mobilePhone='9958721321';
            l.financial_year__c='2016-17';
            insert l;
            database.leadConvert ld=new database.leadconvert();
            ld.setleadid(l.id);
            LeadStatus ls=[select id,masterlabel from leadstatus where isConverted=true Limit 1];
            ld.setConvertedStatus(ls.MasterLabel);
            Database.leadConvertResult lcr=Database.convertLead(ld);
           /* account acc=new Account();
            acc.name=l.company;
            acc.rating='hot';
            insert acc;
            contact con=new contact();
            con.lastname=l.lastname;
            con.F_y__c='2016-17';
            insert con;
opportunity op=new opportunity();
op.name=l.company;
op.CloseDate=Date.valueOf('2018-07-07');
op.StageName='Prospecting';
insert op;*/
        result.success = true;
        return result;
    }
    
    
}