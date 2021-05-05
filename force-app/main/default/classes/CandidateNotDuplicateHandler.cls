public class CandidateNotDuplicateHandler {
public void onAFterInsert(list<candidate__c> TN)
{
    validatecandidate(TN);
}
   void validateCandidate(list<candidate__c> TN)
    {
        map<string,candidate__c> lstC=new map<string,candidate__c>();
       set<string> setName=new set<string>();
        for(candidate__c cd:TN)
        {
        setName.add(cd.name);
        }
        for(candidate__c cd:[select id,name from candidate__c where name IN:setName])
        {
         lstC.put(cd.name,cd);   
        }
        for(candidate__c cd:TN)
        {
            if(lstC.containskey(cd.name))
            {
             cd.name.addError('name already exist') ;   
            }
        }
    }
}