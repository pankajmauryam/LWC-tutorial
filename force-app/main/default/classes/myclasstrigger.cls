public class myclasstrigger {
public static void my_method(list<opportunity> ops)
{
    double total_amount=0;
    for(opportunity op1:[select amount from opportunity where createdDate =Today And createdBYID =:userinfo.getuserid() ])
    {
       total_amount = total_amount + op1.amount; 
       
    }
      for(opportunity op2:ops)
      {
                 total_amount = total_amount + op2.amount; 

            if(total_amount>50000)
            {        
            op2.addError('Exceeded limit');
            }
      }
    system.debug('Total Amount is= '+total_amount);
}
}