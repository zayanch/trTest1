@isTest
public class TestProductTrigger {
	@isTest
    public static void testProductTrigger(){
		Integer amountP = 50;
        createSomeProducts(amountP); 
        
        List<Product__c> prod = [SELECT Name FROM Product__c];
        
        System.assertEquals(amountP, prod.size());
        
        for(Product__c p : prod){
            p.Name = 'newText';
        }
        update prod;
        
        prod = [SELECT Name FROM Product__c WHERE Name = 'newText'];
        System.assertEquals(amountP, prod.size());
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