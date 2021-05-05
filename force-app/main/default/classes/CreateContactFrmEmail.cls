global class CreateContactFrmEmail implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
system.debug('testing=='+email.plainTextBody);
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

            Contact c = new Contact();
            c.LastName = email.subject;
            c.F_Y__c='2017-18';
            insert c;

        result.success = true;
        return result;
    }
    
    
}