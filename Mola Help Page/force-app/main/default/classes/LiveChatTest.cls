@isTest
public with sharing class LiveChatTest {
    public static void initTest(){
        MockupSetupTest.setupUsers();
        MockupSetupTest.createContact();
        MockupSetupTest.createCase();
    }

    @isTest
    static void testSetSLA(){
        initTest();
        User userTest = [SELECT Id FROM User WHERE Email = 'user1@test.com'];
        Case usedCase = [SELECT Id FROM Case WHERE Subject = 'Subject 0'];
        System.runAs(userTest){
            Test.startTest();
            LiveChatVisitor newLcv = new LiveChatVisitor();
            insert newLcv;

            LiveChatTranscript newLct = new LiveChatTranscript(
                CaseId = usedCase.Id,
                Browser = 'Unknown null',
                Body = '<p align="center">Chat Started: Friday, October 11, 2019, 03:08:31 (+0000)</p><p align="center">Chat Origin: SSTV Live Chat</p><p align="center">Agent U</p>( 10s ) U: ya ada apa?<br>( 28s ) Debby: ada apa ya?<br>( 14m 14s ) U: hmmm<br>( 14m 26s ) U: ??????<br>',
                LiveChatVisitorId = newLcv.Id,
                Status = 'Completed'
            );
            
            insert newLct;

            usedCase.Status = 'Done';
            usedCase.Agent_Name__c = 'Achmad';
            usedCase.Category__c = 'General';
            update usedCase;
            
            LiveChatCorrection.checkNeedCorrection();
            DateHelper.convertTimeStringToInteger('1h 1m 1s');
            Test.stopTest();
        }
    }
}