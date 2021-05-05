public class AccountBillingIntoShipingHandler {
public void OnAfterInsert(list<account> TN)
{
    validateShiping(TN);
}
    void validateShiping(list<account> TN)
    {
      for(account acc:TN)
      {
          acc.ShippingCity=acc.BillingCity;
          acc.shippingStreet=acc.BillingStreet;
          acc.ShippingCountry=acc.BillingCountry;
          acc.ShippingState=acc.BillingState;
          acc.ShippingPostalCode=acc.BillingPostalCode;
      }
    }
}