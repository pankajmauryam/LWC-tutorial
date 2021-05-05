public class AccessoriesPriceBookController {
    
    class PriceBookEntryWrapper{
        @auraEnabled public Boolean isSelected;
        @auraEnabled public PricebookEntry objPriceBookEntry;
        
        PriceBookEntryWrapper(Boolean isSelected,PricebookEntry objPriceBookEntry){
            this.isSelected = isSelected;
            this.objPriceBookEntry=objPriceBookEntry;
        }
    }
    class ProductFamilyVsPriceBookEntryWrapper{
        @auraEnabled public string ProductFamily;
        @auraEnabled public list<PriceBookEntryWrapper> lstPriceBookEntryWrapper;
        
        ProductFamilyVsPriceBookEntryWrapper(string ProductFamily,list<PriceBookEntryWrapper> lstPriceBookEntryWrapper){
            this.ProductFamily=ProductFamily;
            this.lstPriceBookEntryWrapper =lstPriceBookEntryWrapper;            
        }
    }
    
    @auraEnabled
    Public static string fetchProductData(string OppID){
            set<Id> setPricebookEntry = new set<Id>();
        if(string.isNotBlank(OppID))
        {
            list<OpportunityLineItem> lstOpportunityLineItem = [select Id,PricebookEntryId from OpportunityLineItem 
                                                                where OpportunityId =:oppID];
            if(!lstOpportunityLineItem.isempty())
            {
                for(OpportunityLineItem eachOppLineItem:lstOpportunityLineItem)
                {
                    setPricebookEntry.add(eachOppLineItem.PricebookEntryId);
                }
            }
            
            
        }
    
        ID recordTypeIdforProduct = MyCommon.getRecordTypeId('Product2','Accessories');
        list<OpportunityLineItem> lstOpportunityLineItem = [select Id,PricebookEntryId from OpportunityLineItem 
                                                            where OpportunityId =:oppID];
        
        list<ProductFamilyVsPriceBookEntryWrapper> lstProductFamilyVsPriceBookEntryWrapper = 
            new list<ProductFamilyVsPriceBookEntryWrapper>();
        Map<string,list<PriceBookEntryWrapper>> MapofProductFamilyVsPriceBookEntryWrapper=
            new Map<string,list<PriceBookEntryWrapper>>();
        
        list<PricebookEntry> lstPriceBookEntry = [SELECT Id,Pricebook2Id, Product2.Name,Product2.Family, Name 
                                                  FROM PricebookEntry 
                                                  where Product2.IsActive= true and
                                                  Product2.RecordTypeId=:recordTypeIdforProduct];
        if(!lstOpportunityLineItem.isempty()){
            for(OpportunityLineItem eachOppLineItem:lstOpportunityLineItem){
                setPricebookEntry.add(eachOppLineItem.PricebookEntryId);
            }
            
        }
        
        if(!lstPriceBookEntry.isEmpty()){
            for(PricebookEntry eachEntry:lstPriceBookEntry){
                
                if(!MapofProductFamilyVsPriceBookEntryWrapper.containsKey(eachEntry.Product2.Family)){
                    
                    MapofProductFamilyVsPriceBookEntryWrapper.put(eachEntry.Product2.Family,new list<PriceBookEntryWrapper>());
                    
                }
                if(!setPricebookEntry.isempty() && setPricebookEntry.contains(eachEntry.Id)){
                    system.debug(setPricebookEntry);
                    MapofProductFamilyVsPriceBookEntryWrapper.get(eachEntry.Product2.Family).add(new PriceBookEntryWrapper(true,eachEntry));
                    system.debug(MapofProductFamilyVsPriceBookEntryWrapper.get(eachEntry.Product2.Family));
                }
                else{
                    MapofProductFamilyVsPriceBookEntryWrapper.get(eachEntry.Product2.Family).add(new PriceBookEntryWrapper(false,eachEntry));
                }                
            }
        }
        if(!MapofProductFamilyVsPriceBookEntryWrapper.isEmpty()){
            for(string productFamily:MapofProductFamilyVsPriceBookEntryWrapper.keySet()){
                lstProductFamilyVsPriceBookEntryWrapper.add(new ProductFamilyVsPriceBookEntryWrapper(productFamily,
                                                                                                     MapofProductFamilyVsPriceBookEntryWrapper.get(productFamily)));
            }
            
        }
        return JSON.serialize(lstProductFamilyVsPriceBookEntryWrapper);    
    }
    
}