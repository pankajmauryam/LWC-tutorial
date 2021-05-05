public class CustomSettingExampleClass {
  
public list<First__c> roll{get;set;}
    public CustomSettingExampleClass ()

    {

         map<string,First__C> allroll = First__c.getAll();
roll=allroll.Values();

      

    }
}