@isTest
public with sharing class CaseHandlingTest {
    @isTest
    public static void changeStatus(){
        MockupSetupTest.setupUsers();
        MockupSetupTest.createContact();
        MockupSetupTest.createCase();

        Case cs = [SELECT Id, CaseNumber, Status, Priority FROM Case WHERE Subject='Subject 0'];
        System.assertEquals('New', cs.Status);
        cs.Status = 'Pending';
        cs.Pending_Reason__c = '1. Eskalasi Tim IT';
        update cs;

        Case csCheck = [SELECT Id, CaseNumber, Status, Priority FROM Case WHERE Id=:cs.Id];
        System.assertEquals('High', csCheck.Priority);
    }
}