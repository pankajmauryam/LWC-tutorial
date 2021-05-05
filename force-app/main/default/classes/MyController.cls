public with sharing class MyController {

    public Account account { get; set; }
    public MyController(){
    account = [select Name,Phone from Account where id =: ApexPages.currentPage().getParameters().get('id')];
    }
    public PageReference save() {
    update account;
        return null;
    }

}