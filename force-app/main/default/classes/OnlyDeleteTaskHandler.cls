public class OnlyDeleteTaskHandler {
    public void OnBeforeDelete(list<task> TO)
    {
        ValidateDelete(TO);
        
    }
    void validateDelete(list<task> TO)
    {
        list<profile> lstId=[select id from profile where name='System Administrator' limit 1];
        system.debug('Id Of User'+lstId[0].id);
         if(system.userinfo.getProfileId()!=lstId[0].id)
      {
        for(task tk:TO)
        {
           
            tk.addError('Not permision to delete');
            
        }
      }
    }
}