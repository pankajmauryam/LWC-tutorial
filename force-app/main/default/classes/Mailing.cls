public class Mailing {

    public Mailing() {

    }


public list<DumyContact> lstcon{get;set;}
    public Mailing(ApexPages.StandardController controller) 
    {
         display();
    }
    public list<DumyContact> display()
    {
        list<DumyContact> lstCon=new list<DumyContact>();
        for(contact objcon:[select id,lastname,email from contact])
        {
    lstCon.add(new DumyContact(objcon));
        }
        return lstCon;
    }
    public class DumyContact
    {
       public boolean checkbox{get;set;}
       public contact obj{get;set;}
       public DumyContact(contact c)
       {
      
       obj=c;
       checkbox=false;
       }
    }
   }