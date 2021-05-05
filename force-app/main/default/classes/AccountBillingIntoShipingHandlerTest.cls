@isTest
public class AccountBillingIntoShipingHandlerTest {
@isTest
    static void abcTest()
    {
        list<account> lstAcc=new list<account>();
        account acc=new account(ShippingCity='delhi',shippingStreet='Food corner',ShippingCountry='india',ShippingState='U.P',
                               ShippingPostalCode='201009');
        lstAcc.add(acc);
        insert lstAcc;
        AccountBillingIntoShipingHandler obj=new AccountBillingIntoShipingHandler();
        obj.OnAfterInsert(lstAcc);
    }
}