public class StudentSchoolRollUpHandler {
    public void OnAfterInsert(list<student__c> TN)
        {
          validateCount(TN);
           
        }
    void validateCount(list<student__c> TN)
    {
     list<school__c> lstSch=new list<school__c>();
        set<id> idset=new set<id>();
        for(student__c objST:TN)
        {
            if(objSt.School__c!=null)
            {
            idSet.add(objST.School__c);
                system.debug('TN-->'+idSet);
            }
        }
         
        if(idSet.size()>0)
        {
            for(school__c objSch:[select id,number_of_student__c,(select id from Students__r) from school__c where id in:idset])
            {
              objSch.number_of_student__c=ObjSch.Students__r.size();
                lstSch.add(objSch);
                system.debug('lstSch-->'+lstSch);
            }
            if(lstSch.size()>0)
            {
                update lstSch;
            }
        }
        
    }

}