public class EmailNotDuplicateHandller {
public void onAfterInsert(list<student__c> TN)
{
    validateEmail(TN);
}
    private void validateEmail(list<student__c> TN)
    {
        map<string,student__c> mpS=new map<string,student__c>();
       set<string> setSt=new set<string>();
        for(student__c st:TN)
        {
            setSt.add(st.email__c);
            
        }
        for(student__c st:[select id,email__c from student__c where email__c IN:setSt])
        {
          mpS.put(st.email__c, st);  
        }
        for(student__c st:TN)
        {
            if(mpS.containskey(st.email__c))
            {
                st.email__c.addError('Email Already Exist');
            }
        }
    }
}