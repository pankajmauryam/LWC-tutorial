public class ContactAccountFeeHandler {
   
public void OnAfterInsert(list<contact> TN)
{
      
    RollupFee(TN);
    
}
    void RollupFee(list<contact> TN)
    {
        list<account> lstAcc=new list<account>();
        set<id> idToupdate=new set<id>();
        for(contact con:TN)
        {
            if(con.AccountID !=null)
            {
                idToupdate.add(con.AccountID);
            }
        }
        if(idToupdate.size()>0)
        {
            for(account acc:[select id,Total_fee__c,(select id,Fee__c from contacts where fee__c!=null) from account where id IN:idToupdate])
            {
                decimal temp=0;          
                for(contact objC:acc.contacts)
                   {  
                     temp=temp + objC.Fee__c ;  
                  }
                acc.Total_Fee__c=temp;
              lstAcc.add(acc);           
            }
            
        }
        if(lstAcc.size()>0)
        {
            update lstAcc;
        }
        
    }
}