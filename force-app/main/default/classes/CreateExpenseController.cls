public class CreateExpenseController {
    @AuraEnabled
    public static id CreateExpenseMethod(id taskId)
    {
      Task objT=[select id,Expense_Header__c,Expense_Header__r.id from Task where id=:taskId limit 1] ;
        if(objT.Expense_Header__r.id!=null)
        {
            return objT.Expense_Header__r.id;         
        }
       else
        {
            Expense_header__c objExpHead=new Expense_header__c(); 
            insert objExpHead;      
            objT.Expense_Header__c=objExpHead.id;
            update objT;
           // system.debug('After insert id'+objT.Expense_Header__c);
            return objT.Expense_Header__c;
        }
        
    }
}