public class ReferBikanerPageClass {
 
public pageReference next()
{
pageReference obj=new pageReference('/apex/myCustomSettingColorVfPage2');
return obj;
}
public pagereference back()
{
pagereference objP=new pagereference('/apex/myCustomSettingColorVfPage');
return objP;
}
}