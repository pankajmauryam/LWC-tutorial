public class ContactRecursiveHandler {
public void onAfterInsert(list<contact> TN)
{
    CreateClone(TN);
}
    void CreateClone(list<contact> TN)
    {
        list<contact> lst=new list<contact>();
        if(ContactRecursion.isExecute==false)
        {
           ContactRecursion.isExecute=true; 
        }
        else
        {
            return;
        }
        for(contact objCon:TN)
        {
                 contact objClone = objCon.clone(false,false,false,false);
            objClone.LastName = objCon.LastName + ' Clone';
            lst.Add(objClone);
            
        }
        if (lst.size() > 0)
        {
            insert lst;
        }
    }
}