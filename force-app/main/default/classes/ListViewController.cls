public class ListViewController {
   
    @AuraEnabled
    public static list<listViewWrapperNew> ListViewCollect()
    {
        /*string str ='select name from listview ' ;
System.debug('@@@'+str);
return str;*/
        list<listViewWrapperNew> lstWrapper = new list<listViewWrapperNew>();
        for(ListView lstv:[select name,developerName from listview where sobjectType='Account'])
        {
            listViewWrapperNew wrapper = new listViewWrapperNew();
            wrapper.myLabel = lstv.name;
            wrapper.myDeveloperName = lstv.developerName;
            lstWrapper.add(wrapper);
        }
      
        return lstWrapper;
        
    }
    @AuraEnabled
    public static list<listViewWrapper> listValues(){
        
        list<listViewWrapper> oListViewWrapper = new list<listViewWrapper>();
        
        for(ListView lv : [SELECT id, Name, DeveloperName FROM ListView
                           WHERE sObjectType ='Account']){ 
                               listViewWrapper oWrapper = new listViewWrapper();
                               oWrapper.label = lv.Name;
                               oWrapper.developerName = lv.DeveloperName;
                               oListViewWrapper.add(oWrapper);
                           }
        
        return oListViewWrapper; 
    }
    
    /*wrapper class to store listView details*/ 
    public class listViewWrapper{
        @AuraEnabled public string label{get;set;} 
        @AuraEnabled public string developerName{get;set;} 
    }
    /*MyWrapper class */
     public class listViewWrapperNew
    {
        @AuraEnabled public string myLabel{get;set;}
        @AuraEnabled public String myDeveloperName{get;set;}
    }
}