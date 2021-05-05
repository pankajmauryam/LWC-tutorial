public class StudentSchoolSumHandler {
    public void OnAfterEvent(list<student__c> TNvsTO)
    {
        list<school__c> lstSchUpdate = new list <school__c>();
        set<id> setId =new set<id>();
        for(Student__c objStd : TNvsTO)
        { 
            if(objStd.School__c != null)
            {
                setId.add(objStd.School__c);
            }
        }
        list<school__c> lstSch = [select id,RelatedStudentAmount__c,(select id,Amount__c from students__r) from school__c where id in:setId];
        if(lstSch.size()>0)
        {
            for(School__c sch:lstSch)
            {
                decimal val =0;
                for(student__c std : sch.students__r)
                {
                    if(std.Amount__c != null)
                    {
                    val=val+std.Amount__c;
                    }
                }
                    sch.RelatedStudentAmount__c = val;
                    lstSchUpdate.add(sch);
                
            }
            update lstSchUpdate;
        }
    }
}