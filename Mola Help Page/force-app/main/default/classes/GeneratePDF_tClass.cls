@isTest
public class GeneratePDF_tClass {
	public static testMethod void testGeneratePDFlive(){
        Id recAssper = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosByName().get('Live Chat').getRecordTypeId();
        Id recAss = Schema.SObjectType.Assessment__c .getRecordTypeInfosByName().get('Live Chat').getRecordTypeId();
        
        Test.startTest();
        AssessmentPeriod__c assper = new AssessmentPeriod__c();
        assper.RecordTypeId = recAssper;
        assper.Name = 'abc';
        assper.Start_Date__c = Date.newInstance(2019, 10, 28);
        assper.End_Date__c = Date.newInstance(2019, 10, 29);
        assper.Agent_Name__c = 'Ahmad Baihaqi';
        assper.Reviewer__c = 'Anissa';
        insert assper;
        
		Assessment__c ass = new Assessment__c();
		ass.RecordTypeId = recAss;
        ass.Assessment_Period__c = assper.id;
        ass.Name = 'abcd';
        insert ass;
        
        pageReference pageRef = Page.GeneratePDF;
        pageRef.getParameters().put('id', assper.id);
    	Test.setCurrentPage(pageRef);
        ApexPages.StandardController sc = new ApexPages.StandardController(assper);
       
        GeneratePDF_C gene = new GeneratePDF_C(sc);
        gene.getData();
        Test.stopTest();
    }
    
    public static testMethod void testGeneratePDFsocial(){
        Id recAssper2 = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
        Id recAss2 = Schema.SObjectType.Assessment__c .getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
        
        Test.startTest();
        
        AssessmentPeriod__c assper2 = new AssessmentPeriod__c();
        assper2.RecordTypeId = recAssper2;
        assper2.Name = 'abcd';
        assper2.Start_Date__c = Date.newInstance(2019, 10, 28);
        assper2.End_Date__c = Date.newInstance(2019, 10, 29);
        assper2.Agent_Name__c = 'Ahmad Baihaqi';
        assper2.Reviewer__c = 'Anissa';
        insert assper2;
        
        Assessment__c ass2 = new Assessment__c();
		ass2.RecordTypeId = recAss2;
        ass2.Assessment_Period__c = assper2.id;
        ass2.Name = 'abcd';
        ass2.Respon_Time_Evaluation__c = 'Pass';
        ass2.Respon_Time_Point__c = 3;
        ass2.Respon_Time_Score__c = 100;
        ass2.Information_Accuracy_Evaluation__c = 'Pass';
        ass2.Information_Accuracy_Point__c = 3;
        ass2.Information_Accuracy_Score__c = 100;
        ass2.Courtesy__c = 'Pass';
        ass2.Courtesy_Point__c = 1;
        ass2.Courtesy_Score__c =100;
        ass2.Total_Score__c = 100;
        ass2.Remarks_Pujian__c = 1;
        ass2.Ketidaksesuaian__c = 'Test';
        ass2.Alasan__c = 'test';
        ass2.Score_and_Remarks_Pujian__c = 100;
        ass2.Input_Status__c = 'New';
        insert ass2;
        
        pageReference pageRefs = Page.GeneratePDF;
        pageRefs.getParameters().put('id', assper2.id);
    	Test.setCurrentPage(pageRefs);
        ApexPages.StandardController sc2 = new ApexPages.StandardController(assper2);
        
        GeneratePDF_C gene2 = new GeneratePDF_C(sc2);
        gene2.getData();
        Test.stopTest();
    }
}