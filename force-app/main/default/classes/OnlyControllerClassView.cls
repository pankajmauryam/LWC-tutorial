public class OnlyControllerClassView  
{
    public Account objAcc{get;set;}
    public integer intAge{get;set;}
    
    public OnlyControllerClassView  ()
    {
        intAge = 0;
        objAcc = new Account();
        
        if(apexpages.currentpage().getparameters().get('id') != null)
        {
            id objAccid =apexpages.currentpage().getparameters().get('id');
            list<Account> lstAcc = [select id,name,parentid,DOB__c,Site from account where id =:objAcc.id ];
            
            if(lstAcc != null && lstAcc.size() >0)
                objAcc = lstAcc[0];
            
            calculateAge(); 
        }
    }
    
    public void edit()
    {
       
    }
    
    
    public pagereference deleteData()
    {
        pagereference objP = new pagereference('/001/o');
        return objP;
    }
    
    public void calculateAge()
    {
        if(objAcc.DOB__c != null)
        {
            intAge = (system.today().year() - objAcc.DOB__c.year());
        }
    }
}