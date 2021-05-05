public class ChangeBackgroundImageOnPicklistCtrl {
    @AuraEnabled
    public static list<String> getTypeOfPicture()
    {
        list<string> typeOfPicture = new list<String>();
        List<Schema.PicklistEntry> lstTypeOfPictureField = Account.Type_of_Picture__c.getDescribe().getPicklistValues();
        for(Schema.PicklistEntry ple:lstTypeOfPictureField)
        {
            typeOfPicture.add(ple.getValue());
        }
        system.debug('Picklistvalues-->'+typeOfPicture);
        return typeOfPicture;
    }
    @AuraEnabled
    public static list<Account> fetchAccountData()
    {
        List<Account> acc=[select name from Account ];
        system.debug('account deatil'+acc);
     return acc;
    }

}