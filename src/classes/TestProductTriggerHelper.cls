@isTest
public class TestProductTriggerHelper {
    
    @isTest
    public static void testTriggerHelperBeforeInsert(){
        Integer amountP = 50;
        createSomeProducts(amountP); 
                              
        System.assertEquals(amountP,getDescripAmount(),'all descriptions length <= 200');
        System.assertEquals(amountP,getAddedDateAmount(),'all added dates != null');
    }
    
    @isTest
    public Static void testTriggerHelperBeforeUpdate(){
        Integer amountP = 50;
        createSomeProducts(amountP); 
        
        List<Product__c> prod = [SELECT Description__c FROM Product__c];
        
        String str = 'mama'.repeat(100);
        for(Product__c p : prod){
        	p.Description__c = str;
        }        
        update prod;
        
        System.assertEquals(amountP,getDescripAmount(),'all descriptions length <= 200');
    }
    
    public static Integer getDescripAmount(){
        List<Product__c> prod = [SELECT Description__c FROM Product__c];
        Integer descripAmount = 0;
        for(Product__c p : prod){
            if(p.Description__c.length() <= 200){
                descripAmount++;
            }
        }        
        return descripAmount;
    }
    
    public static Integer getAddedDateAmount(){
        List<Product__c> prod = [SELECT AddedDate__c FROM Product__c];
        Integer addedDateAmount = 0;
        for(Product__c p : prod){            
            if(p.AddedDate__c != null){
                addedDateAmount++;
            }
        } 
        return addedDateAmount;
    }
    
    public static void createSomeProducts(Integer howMany){
        String str = 'mama'.repeat(100);
        List<Product__c> prod = new List<Product__c>();
        for(Integer i = 0;i < howMany;i++){
            prod.add(new Product__c(Name = 'test',
                                    Description__c = str,
                                    UnitPrice__c = 7,
                                    UnitsAvailable__c = 250));
        }
        insert prod;
    }
}