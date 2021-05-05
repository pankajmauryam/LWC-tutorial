public class StageLabelGet {
public static void getLabelOfStage()
{
    opportunity opp=[select id,stageName from opportunity limit 1];
 Schema.DescribeFieldResult fieldResult =
        opportunity.Type.getDescribe();

system.debug('@@@='+fieldResult.getType());
}
}