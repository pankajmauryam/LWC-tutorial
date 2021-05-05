global class MyClass
{
webservice static string CreatedLead(String FName,String LName)
{
try
{
Lead objL=new Lead();
objL.FirstName=fName;
objL.LastName=LName;
objL.Company='test company';
insert objL;
return 'success';
}
catch(Exception obj)
{
return 'Fail';
}
}

}