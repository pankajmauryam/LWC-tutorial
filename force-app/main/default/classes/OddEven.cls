public class OddEven
{
     public OddEven()
  {
list<integer> lt1=new list<integer>();
list<integer> lt2=new list<integer>();
    for(integer i=1;i<=100;i++)
  {
   if(system.math.mod(i,2)==0)
    {
    lt1.add(i);
    } 
    else
    {
        lt2.add(i);
    }
  }
system.debug('even no.'+lt1);
system.debug('odd no.'+lt2);  
 }
}