public class AccountController {
public integer Age{get;set;}
public Account Acc;
    public AccountController ()
    {
        system.debug('first instance==');
        calculateAge();
   //     ABC();
    }
    public AccountController(ApexPages.StandardController controller) 
    {
    age=0;
    acc=(Account)Controller.getRecord();
    }
   public void calculateAge()
    {
      integer a=0;
     //age= Date.Today().year()-Acc.Dob__c.year();
     for(Account ac :[select id from account where name ='test' and rating='cold' ])
     {
         a++;
     }
     system.debug('first instance==');
   //  ABC();
    }
  /*  @future(callout=true)
    public static void ABC()
    {
        system.debug('future call==');
    }
*/
}