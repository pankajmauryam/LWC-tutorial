public class myage {
 public Integer ages {get; set;}    
    public Date dt1 {get; set;}
     
    public void FindAge()
    {
        ages= Date.Today().year()-dt1.year();
       
    }
}