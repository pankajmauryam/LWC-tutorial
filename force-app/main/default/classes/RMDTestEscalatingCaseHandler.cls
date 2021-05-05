public class RMDTestEscalatingCaseHandler {
 public void OnBeforeUpdate(list<Case> TN,map<id,Case> TOM)
    {
        updatePersonResponsiblewithCaseownerManager(TN,TOM);
        
    }
    void updatePersonResponsiblewithCaseownerManager(list<Case> TN,map<id,Case> TOM)
    {
       Set<Id> setOwnerId = new Set<Id>();
        for(case objCase: TN)
        {
            if( objCase.status=='Escalated')
            {
                setOwnerId.add(objCase.OwnerId);
                system.debug('setOwnerId-->'+setOwnerId);
                
            }
        }
 
        list<user> lstUser =new list<user>();
        if(setOwnerId.size() > 0){  
        lstUser=[Select id,Name, ManagerId, Manager.Email From User Where Id IN:setOwnerId ];
        }
        map<id,string> mapOwnerIdAndName = new map<id,string>();
        list<case> updateCase = new list<case>();
        system.debug('lstUserSize-->'+lstUser.size());
        if(lstUser.size()>0)
        {
            
            for(User caseOwnerUser : lstUser) {
                system.debug('caseOwnerManagerId-->'+caseOwnerUser.ManagerId);
                if(caseOwnerUser.ManagerId != null) {
                    mapOwnerIdAndName.put(caseOwnerUser.Id, caseOwnerUser.ManagerId);
                }
            }
            for(Case objCase: TN)
            {
                if(mapOwnerIdAndName.containsKey(objCase.OwnerId)) {
                    system.debug('MangagerId-->'+mapOwnerIdAndName.get(objCase.OwnerId));
                    objCase.Responsible_person__c =  mapOwnerIdAndName.get(objCase.OwnerId);
                    updateCase.add(objCase);
                }
            }
            //update updateCase;
        }
    }
}