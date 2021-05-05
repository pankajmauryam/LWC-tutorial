public class NUTagEntitlementIdOnCase {
    @InvocableMethod(label='Get Entitlement Ids' description='Returns the list of Entitlements Id corresponding to the specified account IDs.')
    
    public static void getEntitlementIdRelatedAccount(List<Case> Cases) {
        list<Case> lstCase = [SELECT id,EntitlementId,AccountId from Case where id iN:Cases]; 
        list<id> lstAccountId =new list<id>();
        for(Case objCase :lstCase )
        {
            lstAccountId.add(objcase.AccountId);
        }
        
        map<id,string> mapEntitlementId = new map<id,string>();
        list<case> updateCaseEntitlementId = new list<case>();
        list<Entitlement> lstEntitlementId = [SELECT id,accountId FROM Entitlement WHERE AccountId in :lstAccountId];
        for(Entitlement ent:lstEntitlementId)
        {
            if(ent.accountId != null)
            {
            mapEntitlementId.put(ent.accountId,ent.id);
            }
        }
       
        for(Case objCases :lstCase )
        {
            if(mapEntitlementId.get(objCases.accountId) != System.Label.Entitlement_Id && mapEntitlementId.containsKey(objCases.accountId))
            { 
                objcases.EntitlementId = mapEntitlementId.get(objCases.accountId);
                updateCaseEntitlementId.add(objcases);
            }
            else
            {
               objcases.EntitlementId =  System.Label.Entitlement_Id;
               updateCaseEntitlementId.add(objcases);
            }
        } 
        update updateCaseEntitlementId;      
    }
}