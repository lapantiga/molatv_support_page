@isTest
public class AssessmentExport_tClass {
    public static testMethod void testGenerateExcel(){
        Id recAssper = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
        Id recAss = Schema.SObjectType.Assessment__c .getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
        
        Test.startTest();
        
        AssessmentPeriod__c assper = new AssessmentPeriod__c();
        assper.RecordTypeId = recAssper;
        assper.Name = 'a-b';
        assper.Start_Date__c = Date.newInstance(2019, 10, 28);
        assper.End_Date__c = Date.newInstance(2019, 10, 29);
        assper.Agent_Name__c = 'Ahmad Baihaqi';
        assper.Reviewer__c = 'Anissa';
        insert assper;
        
        Assessment__c ass = new Assessment__c();
        ass.RecordTypeId = recAss;
        ass.Assessment_Period__c = assper.id;
        ass.Name = 'abc';
        insert ass;
        
		pageReference pageRef = Page.ExportExcelLoader;
        pageRef.getParameters().put('apId', assper.id);
        Test.setCurrentPage(pageRef);        
        ApexPages.StandardController sc = new ApexPages.StandardController(assper);
        AssessmentExport gene = new AssessmentExport(sc);
        gene.convert();
        gene.excelSocmedEmail();
        gene.excelLiveChat();
        Test.stopTest();
    }
}