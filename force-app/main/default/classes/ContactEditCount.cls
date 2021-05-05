public class ContactEditCount {
public void onAfterUpdate(list<contact> TN,map<id,contact> TOM)
{
 validateCount(TN,TOM);  
}
    void ValidateCount(list<contact> TN,map<id,contact> TOM)
    {
        list<contact> lstCon=new list<contact>();
        double count;
     for(contact objCon:TN)
     {
         if(objCon.edit_count__c==null)
         {
             ObjCon.edit_count__c=0;
         }
        if(objCon.lastname!=TOM.get(objCon.id).lastname) 
        {
            count=objCon.Edit_count__c+1;
            objCon.Edit_count__c=count;
        }
         
         //lstCon.add(objCon);
     }
        
        
       
    }
}