public class CalculateAge1 {

  public Integer age { get;set;}
  public integer number1{get;set;}
  public double number2{get;set;}    
    public Account Objacc;
    public CalculateAge1(ApexPages.StandardController controller) {
 age=0;
 objAcc=(Account)Controller.getRecord();
    }
    
    public void FindAge()
    {
   
        age = Date.Today().year() - objAcc.Dob__c.year();     
  
    }
       public void increment()
    {
    number2=number1*0.5;
      
  
    }
    }