public class ProductTriggerHelper {
    
    public static void triggerHelperBeforeInsert(List<Product__c> product){
        for(Product__c prod : product){
            if(prod.AddedDate__c == null){
                prod.AddedDate__c = Datetime.now().addHours(3);
            }            
        }
        trimDescription(product);
        
    }
    
    public static void triggerHelperBeforeUpdate(List<Product__c> product){
    	trimDescription(product);
    }
    
    public static void trimDescription(List<Product__c> product){
        for(Product__c prod : product){
            if(prod.Description__c.length() >= 200){
                prod.Description__c = prod.Description__c.substring(0,197)+'...';
            }
        }
    }

}