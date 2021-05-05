public class mytestcontroller1 {

    public account acc;
    public contact con{get;set;}
   public mytestcontroller1(ApexPages.StandardController controller) {
        acc= (Account)controller.getrecord();
        con = new contact();
        for(contact c : [select id,firstname from contact where accountid=:acc.id limit 1])
            con =c;
    } 
    
    public pagereference Save()
    {
        
        return null;
    }
}