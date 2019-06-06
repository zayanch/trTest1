public class ProductTablePageController{
    public List<Product__c> products;
    public String name,imageURL,descripthion,dateTimeStr;
    public Integer unitAvailable;
    public Double unitPrice;
    public Datetime addedDate;
 
    public List<Product__c> getProducts(){
        return [SELECT Name,ImageURL__c,UnitPrice__c,UnitsAvailable__c,Description__c
                FROM Product__c
                ORDER BY AddedDate__c DESC];
    }
    
    public void productCreation(){
        name = ApexPages.currentPage().getParameters().get('name');
        imageURL = ApexPages.currentPage().getParameters().get('imageURL');
        descripthion = ApexPages.currentPage().getParameters().get('descripthion');
        unitPrice = Double.valueOf(ApexPages.currentPage().getParameters().get('unitPrice'));
		unitAvailable = Integer.valueOf(ApexPages.currentPage().getParameters().get('unitAvailable'));
        
        dateTimeStr = ApexPages.currentPage().getParameters().get('addedDate');
        addedDate = convertToDatetime();
        
        newProduct();
    }
    
    public void newProduct(){
        Product__c prod = new Product__c();
        prod.Name = name;
        prod.ImageURL__c = imageURL;
        prod.UnitPrice__c = unitPrice;
        prod.UnitsAvailable__c = unitAvailable;
        prod.Description__c = descripthion;
		prod.AddedDate__c = addedDate;
        
        insert prod;
    }
    
    public Datetime convertToDatetime(){
        if(dateTimeStr != ''){
           return Date.valueOf(dateTimeStr); 
        }else{
           return null;
        }
    }
}