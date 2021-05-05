public class trigger_class
{
public static void trigger_method(list<opportunity> ops)
{
double total_amount=0;
for(opportunity op1:[select Amount from Opportunity where createdDate=Today 
                     AND createdById =: UserInfo.getUserId()])
{
Total_amount = Total_amount + op1.amount;
}
for(opportunity op2:ops)
{
total_amount = total_amount + op2.amount;
if(Total_amount > 50000)
op2.addError('Exceeded limit of amount');
}
}
}