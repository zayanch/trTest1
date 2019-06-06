@isTest
public class TestProductTablePageController {
    
    @isTest
    public static void testGetProducts(){
        createSomeProducts(50); 
        PageReference page = Page.ProductTablePage;
        Test.setCurrentPage(page);        
        ProductTablePageController ctrl = new ProductTablePageController();       
        List<Product__c> prod = [SELECT Name,UnitPrice__c,Description__c FROM Product__c];       
        System.assertEquals(prod,ctrl.getProducts());         
    }
    
    @isTest
    public static void testproductCreation(){  
        Product__c prod = new Product__c(Name = 'test',
                                         Description__c = 'some text',
                                         UnitPrice__c = 7,
                                         UnitsAvailable__c = 250,
                                         AddedDate__c = Date.today());
        
        PageReference page = Page.ProductTablePage;
        page.getParameters().put('name', prod.Name);
        page.getParameters().put('descripthion', prod.Description__c);
        page.getParameters().put('unitPrice', ''+prod.UnitPrice__c);
        page.getParameters().put('unitAvailable', ''+prod.UnitsAvailable__c);
        page.getParameters().put('addedDate', ''+prod.AddedDate__c);
        Test.setCurrentPage(page);      
        
        ProductTablePageController ctrl = new ProductTablePageController(); 
        ctrl.productCreation();
        
        List<Product__c> testProd = [SELECT Name,UnitPrice__c,Description__c,AddedDate__c
                                     FROM Product__c
                                     WHERE Name =:prod.Name AND AddedDate__c =: prod.AddedDate__c AND UnitPrice__c =:prod.UnitPrice__c];
        System.assertEquals(false, testProd.isEmpty());      
            
    }
    
    public static void createSomeProducts(Integer howMany){
        List<Product__c> prod = new List<Product__c>();
        for(Integer i = 0;i < howMany;i++){
            prod.add(new Product__c(Name = 'test',UnitPrice__c = 5,Description__c = 'some text'));
        }
        insert prod;
    }
    

}