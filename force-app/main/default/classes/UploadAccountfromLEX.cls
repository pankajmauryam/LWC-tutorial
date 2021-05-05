public class UploadAccountfromLEX {
    
    @AuraEnabled
    public static string insertData(String strfromlex,String recId)
    {
        String returnresponse ='';
        List<Account> AccountListtoInsert = new List<Account>();
        system.debug('@@@ strfromlex = ' + strfromlex);
        List<fieldWrapper> datalist = (List<fieldWrapper>) JSON.deserialize(strfromlex, List<fieldWrapper>.class);
        system.debug('@@@ datalist = ' + datalist);
        system.debug('@@@ datalistSize = ' + datalist.size());
        for(fieldWrapper wrapper: datalist)
        {
            Account acc =new  Account();
            acc.Name = wrapper.Name;
            acc.Site = wrapper.site;
            acc.CurrencyIsoCode = wrapper.CurrencyIsoCode;
            acc.Campaign__c=recId;
            AccountListtoInsert.add(acc);
        }
        if(AccountListtoInsert.size() > 0)
        {
            try {
                insert AccountListtoInsert;
                returnresponse = 'SUCCESS';
            }
            catch(Exception ex)
            {
                returnresponse = 'ERROR';
            }
        }
        return returnresponse;
    }
  
    public class fieldWrapper {

    public String Name;
        
    public String Site;

    public String CurrencyIsoCode;

  } 
}