@isTest
public with sharing class CheckListCase_t {
    
    @isTest
    public static Object fetchCase() {
        Id recAssper = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
    	Id recAssperLive = Schema.SObjectType.AssessmentPeriod__c .getRecordTypeInfosByName().get('Live Chat').getRecordTypeId();
        AssessmentPeriod__c asmPer = new AssessmentPeriod__c();
        
        asmPer.Agent_Name__c = 'Ahmad Baihaqi';
        asmPer.Start_Date__c = Date.newInstance(2019, 09, 01);
        asmPer.End_Date__c = Date.newInstance(2019, 10, 01);
        asmPer.RecordTypeId = recAssper;
        insert asmPer;

        system.debug(asmPer.id);

        CheckListCaseController.fetchCase(asmPer.Id);
        
        return null;
    }

    @isTest
    public static Object fetchCaseLive() {
        Id recAssper = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
    	Id recAssperLive = Schema.SObjectType.AssessmentPeriod__c .getRecordTypeInfosByName().get('Live Chat').getRecordTypeId();
        AssessmentPeriod__c asmperLive = new AssessmentPeriod__c();
        
        asmperLive.Agent_Name__c = 'Ahmad Baihaqi';
        asmperLive.Start_Date__c = Date.newInstance(2019, 09, 01);
        asmperLive.End_Date__c = Date.newInstance(2019, 10, 01);
        asmperLive.RecordTypeId = recAssperLive;
        insert asmperLive;

        system.debug(asmperLive.id);

        CheckListCaseController.fetchCase(asmperLive.Id);
        
        return null;
    }

    @isTest
    public static void fSave() {
        List<Case> cs = new list<Case>();
        //for(Case csList : cs) {
            cs.add(new Case(
                Agent_Name__c = 'Ahmad Baihaqi',
                Subject = 'ini ada siaran',
                Origin = 'Facebook'
            ));
            cs.add(new Case(
                Agent_Name__c = 'Ahmad Baihaqi',
                Subject = 'ini ada siaran bagus',
                Origin = 'Instagram'
            ));
            cs.add(new Case(
                Agent_Name__c = 'Ahmad Baihaqi',
                Subject = 'ini ada siaran bagus qowiueqwoieuwqoiedfkgfdklgfdklgjflkfjdgldfjgfdlkgjflkgjdflkgjuqweoiqwuewoqiueqwoieuqwoeioeirt',
                Origin = 'Instagram'
            ));
        //}
        insert cs;


        Id recAssper = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();
    	Id recAssperLive = Schema.SObjectType.AssessmentPeriod__c .getRecordTypeInfosByName().get('Live Chat').getRecordTypeId();
        AssessmentPeriod__c asmPer = new AssessmentPeriod__c();
        
        asmPer.Agent_Name__c = 'Ahmad Baihaqi';
        asmPer.Start_Date__c = Date.newInstance(2019, 09, 01);
        asmPer.End_Date__c = Date.newInstance(2019, 10, 01);
        asmPer.RecordTypeId = recAssper;
        insert asmPer;

        Id recAss = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get('Social Media + Email').getRecordTypeId();

        Assessment__c asm = new Assessment__c();
        asm.Case_Number__c = cs.get(0).Id;
        asm.Assessment_Period__c = asmper.id;
        asm.RecordTypeId = recAss;

        insert asm;

        // List<Assessment__c> asmInsert = new List<Assessment__c>();
        // for(Case cases : cs) {
        //     asmInsert.add(new Assessment__c(
        //         Name = cases.Subject,
        //         Case_Number__c = cases.Id,
        //         Subject_Custom__c = cases.Subject,
        //         Agent_Name__c = cases.Agent_Name__c,
        //         Input_Status__c = 'New',
        //         Assessment_Period__c = asmper.Id,
        //         RecordTypeId = recAss
        //     ));
        // }

        // insert asmInsert;

        System.debug(cs);
        system.debug(asmPer.id);
        //System.debug(asmInsert);

        
        CheckListCaseController.FieldSave(cs, asmper.id);

    }
}