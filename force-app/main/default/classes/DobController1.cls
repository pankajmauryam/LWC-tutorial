public class DobController1 {
public integer age{get;set;}
    public String CustomerName{get;set;}
public Date Dob{get;set;}

public pageReference findAge()
{
age=Date.Today().year()-Dob.year();
return null;
} 
}