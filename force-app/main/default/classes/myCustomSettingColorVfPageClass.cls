public class myCustomSettingColorVfPageClass {
public list<Snacks__c> snack{get;set;}
public myCustomSettingColorVfPageClass()
{
map<string,Snacks__c> obj=Snacks__c.getAll();
snack=obj.values();
} 
}