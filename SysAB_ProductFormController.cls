public with sharing class SysAB_ProductFormController {
    public class ProductFormWrapper {
        //Common Information
        @AuraEnabled public String productType;
        @AuraEnabled public String clientId;
        @AuraEnabled public String accountNo;
        @AuraEnabled public String accountName;
        @AuraEnabled public String purpose;
        @AuraEnabled public String requester;
        @AuraEnabled public String checker;

        //Product A
        @AuraEnabled public Boolean paHasD0;
        @AuraEnabled public String paD0Time;
        @AuraEnabled public Boolean paHasD1;
        @AuraEnabled public String paD1Time;
        @AuraEnabled public String paBatchRef;
        @AuraEnabled public String paDebitAccNo;

         //Product B
        @AuraEnabled public String pbCycle;
        @AuraEnabled public String pbFileFormat;
        @AuraEnabled public String pbCompanyCode;

         //Product C
        @AuraEnabled public String pcDebitAccNo;
        @AuraEnabled public Boolean pcWithholding;
        @AuraEnabled public String pcPriority;
    }

    @AuraEnabled
    public static String buildBodyRequest(ProductFormWrapper productForm) {
        Map<String,Object> product = buildJsonProduct(productForm);
        Map<String,Object> bodyMap = new Map<String,Object>();  
        bodyMap.put('productType', productForm.productType);
        bodyMap.put('clientId', productForm.clientId);
        bodyMap.put('accountNo', productForm.accountNo);
        bodyMap.put('accountName', productForm.accountName);
        bodyMap.put('purpose', productForm.purpose);
        bodyMap.put('requester', productForm.requester);
        bodyMap.put('checker', productForm.checker);
        bodyMap.put('product', product);
        return JSON.serializePretty(bodyMap);
    }

    @TestVisible
    private static Map<String,Object> buildJsonProduct(ProductFormWrapper productForm) {
        Map<String,Object> product = new Map<String,Object>();
        if(productForm.productType.equals('PA')) product = buildJsonProductA(productForm);
        if(productForm.productType.equals('PB')) product = buildJsonProductB(productForm);
        if(productForm.productType.equals('PC')) product = buildJsonProductC(productForm);

        return product;
    }

    @TestVisible
    private static Map<String,Object> buildJsonProductA(ProductFormWrapper productForm) {
        Map<String,Object> productA = new Map<String,Object>();
        productA.put('paHasD0', productForm.paHasD0);
        productA.put('paHasD1', productForm.paHasD1);
        productA.put('accountNo', productForm.accountNo);
        productA.put('accountName', productForm.accountName);
        productA.put('purpose', productForm.purpose);
        productA.put('requester', productForm.requester);
        productA.put('checker', productForm.checker);
        productA.put('paBatchRef', productForm.paBatchRef);

        if(productForm.paHasD0){
            productA.put('paD0Time', productForm.paD0Time);
        }

        if(productForm.paHasD1){
            productA.put('paD1Time', productForm.paD1Time);
            productA.put('paDebitAccNo', productForm.paDebitAccNo);
        }
        return productA;
    }

    @TestVisible
    private static Map<String,Object> buildJsonProductB(ProductFormWrapper productForm) {
        Map<String,Object> productB = new Map<String,Object>();
        productB.put('pbCycle', productForm.pbCycle);
        productB.put('pbFileFormat', productForm.pbFileFormat);
        productB.put('pbCompanyCode', productForm.pbCompanyCode);
        return productB;
    }

    @TestVisible
    private static Map<String,Object> buildJsonProductC(ProductFormWrapper productForm) {
        Map<String,Object> productC = new Map<String,Object>();
        productC.put('pcDebitAccNo', productForm.pcDebitAccNo);
        productC.put('pcWithholding', productForm.pcWithholding);
        productC.put('pcPriority', productForm.pcPriority);
        return productC;
    }
}