public class BdayWishBatchStudentSchedule implements schedulable {
public void execute(SchedulableContext sc)
{
 BdaywishBatchStudent bd=new BdaywishBatchStudent();
    Database.executeBatch(bd);
}
}