public with sharing class CheckListCaseController {
    /*public static List <Account> fetchAccounts() {
        //Qyery 10 accounts
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry, Type from Account LIMIT 10];
        //return list of accounts
        return accList;
    }*/
    public static string agentName = '';

    @AuraEnabled
    public static Object fetchCase(ID periodId) {
        System.debug('periodId '+periodId);
        ResponseFetchData resp = new ResponseFetchData();
        AssessmentPeriod__c periodInfo = [SELECT Agent_Name__c, Start_Date__c, End_Date__c, RecordTypeId, RecordType.Name
                                        FROM AssessmentPeriod__c   
                                        WHERE Id = :periodId];
        
        System.debug('agentName '+periodInfo.Agent_Name__c);
        //Query Case
        List<Case> csList = new List<Case>();
        if(periodInfo.RecordType.Name == 'Social Media + Email') {
            csList = [SELECT Id, Agent_Name__c, Subject, CaseNumber, CreatedDate, Origin, Status, Category__c, SLA_First_Response__c
                            FROM Case 
                            WHERE Agent_Name__c = :periodInfo.Agent_Name__c AND CreatedDate >= :periodInfo.Start_Date__c AND CreatedDate <= :periodInfo.End_Date__c
                            AND (Origin = 'Facebook' OR Origin = 'Instagram' OR Origin = 'Twitter' OR Origin = 'Email') AND Subject != null AND 
                            Id NOT IN (SELECT Case_Number__c FROM Assessment__c WHERE  Assessment_Period__c = :periodId) order by CreatedDate];
        }
        else {
            csList = [SELECT Id, Agent_Name__c, Subject, CaseNumber, CreatedDate, Origin, Status, Category__c, SLA_First_Response__c
                            FROM Case 
                            WHERE Agent_Name__c = :periodInfo.Agent_Name__c AND CreatedDate >= :periodInfo.Start_Date__c AND CreatedDate <= :periodInfo.End_Date__c
                            AND (Origin = 'Web' OR Origin = 'Mobile App') AND Subject != null AND Subject != null AND 
                            Id NOT IN (SELECT Case_Number__c FROM Assessment__c WHERE Assessment_Period__c = :periodId) order by CreatedDate];
        }
        
        //resp.checkData = false;
        //resp.csValue = csList.size();
        //resp.caseList = new List<Case>();
        resp.recTypeName = periodInfo.RecordType.Name;
        resp.checkData = true;
        resp.caseList = csList;
        System.debug('csList '+csList.size());
        return resp;
    }

    @AuraEnabled
    public static void FieldSave(List<Case> caseList, Id periodId){
        Map<Id, Case> caseIdMap = new Map<Id, Case>();
        for(Case c: caseList){
            caseIdMap.put(c.Id, c);
        }
        // check assessmentPeriod for recordTypeId
        AssessmentPeriod__c periodInfo = [SELECT Agent_Name__c, Start_Date__c, End_Date__c, RecordTypeId, RecordType.Name
                                        FROM AssessmentPeriod__c   
                                        WHERE Id = :periodId ];
        // checking apakah caselist sudah pernah masuk
        // populate dulu
        String recAssesmentPeriod = '';
        recAssesmentPeriod = periodInfo.RecordType.Name;
        System.debug('recasses '+recAssesmentPeriod);
        List<Assessment__c> checkCase = [SELECT Id, Case_Number__c, RecordTypeId FROM Assessment__c WHERE
                                            Assessment_Period__c = : periodId];
        // remove list yang sudah pernah masuk. karena tidak perlu ditambahkan.
        String recType = '';
        System.debug('cek Kasus '+checkCase.size());
        for(Assessment__c asm: checkCase){
            recType = asm.RecordTypeId;
            if(caseIdMap.containsKey(asm.Case_Number__c))
                caseIdMap.remove(asm.Case_Number__c);
        }
        System.debug('recType '+recType);
        //System.debug('Case RecType '+caseIdMap.get(checkCase[0].RecordTypeId));
        List<RecordType> SobjList = [select id, name from RecordType WHERE SObjectType ='Assessment__c' AND Name = :recAssesmentPeriod];
        System.debug('sobj RecType '+SobjList[0].Id);
        //Id recTypeAssessment = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get(SobjList[0].Id).getRecordTypeId();
        //System.debug(recTypeAssessment);        
        List<Assessment__c> assessmentList = new List<Assessment__c>();
        System.debug('caseMap '+caseIdMap);
        String SubName = '';
        for(Case cs : caseIdMap.values()) {
            if(cs.Subject.length()>79) {
                SubName = cs.Subject.Substring(0,79);
            }else {
                Subname = cs.Subject;
            }
            assessmentList.add(new Assessment__c(
                Name = SubName,
                Case_Number__c = cs.Id,
                Subject_Custom__c = cs.Subject,
                //External_ID__c = csNumber,
                Agent_Name__c = cs.Agent_Name__c,
                Input_Status__c = 'New',
                Assessment_Period__c = periodId,
                RecordTypeId = SobjList[0].Id
            ));
        }
        Upsert assessmentList;
        System.debug('Ass '+assessmentList);
        //List<Assessment__c> Assm = new List<Assessment__c>();
        //update UpdateAssmnt;
        // System.debug('Case size '+cs.size());
    }

    public class ResponseFetchData{
        @AuraEnabled public Boolean checkData;
        @AuraEnabled public List<Case> caseList;
        @AuraEnabled public Integer csValue;
        @AuraEnabled public String recTypeName;
    }
}