global class myHandler implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
           Contact c = new Contact();

            c.LastName = email.plainTextBody;

            insert c;
             result.success = true;

          return result;
      }
  }