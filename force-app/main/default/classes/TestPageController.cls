public class TestPageController {
    public account acc{get;set;}
    
    public TestPageController ()
    {    
        acc = new Account();
        id accid = apexpages.currentpage().getparameters().get('id');
        acc = [select id ,name from account where id=:accid];
    }

}