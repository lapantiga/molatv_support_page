@isTest
public with sharing class AccountRestApiTest {
    @isTest
    public static void testApi() {
        MockupSetupTest.setupUsers();

        Test.startTest();
        RestRequest reqNew = new RestRequest(); 
        RestResponse resNew = new RestResponse();
        reqNew.requestURI = '/services/apexrest/account/bulkinsert'; 
        reqNew.httpMethod = 'PUT';
        reqNew.addHeader('Content-Type', 'application/json'); 
        reqNew.requestBody = Blob.valueOf('[{"uid":"x0dLIbTUbk8jHY3xZIluQV1q6sEyTI","email":"test.user.1@example.com","phone":"6284784388","name":"Test User 1","birthdate":"1980-04-28","gender":"m","location":"Indonesia","status":1,"createdAt":"2019-08-01T10:59:00.000Z","appID":2,"deviceID":"e847d17a-68a5-4819-9061-5487072333ed"},{"uid":"x0dLIbTUbk8jHY3xZIluQV7467HBFHK","email":"test.user.2@example.com","phone":"62864763839","name":"Test User 2","birthdate":"1991-02-27","gender":"f","location":"Indonesia","status":1,"createdAt":"2019-08-01T10:59:00.000Z","appID":2,"deviceID":"e847d17a-68a5-4819-9061-5487072333ee","serial_number":"123456"}]');
        RestContext.request = reqNew;
        RestContext.response = resNew;
        AccountRestApi.bulkinsert();

        // assert the data
        Account[] acctList = [SELECT Id, Name FROM Account];
        System.assertEquals(2, acctList.size());
        Integer idx = 1;
        // Integer currUser = 0;
        for(Account con: acctList){
            // currUser = idx + 1;
            System.assertEquals('Test User '+String.valueOf(idx), con.Name);
            idx = idx + 1;
        }

        // Test.startTest();
        reqNew = new RestRequest(); 
        resNew = new RestResponse();
        reqNew.requestURI = '/services/apexrest/account/bulkupdate'; 
        //req.params.put('phoneNumber', '9876543210');
        //req.params.put('claimNumber', '111111');
        reqNew.httpMethod = 'PATCH';
        reqNew.addHeader('Content-Type', 'application/json'); 
        reqNew.requestBody = Blob.valueOf('[{"uid":"x0dLIbTUbk8jHY3xZIluQV1q6sEyTI","email":"test.user.3@example.com","phone":"6284784388","name":"Test User 3","birthdate":"1980-04-28","gender":"m","location":"Indonesia","status":1,"createdAt":"2019-08-01T10:59:00.000Z","appID":2,"deviceID":"e847d17a-68a5-4819-9061-5487072333ed"},{"uid":"x0dLIbTUbk8jHY3xZIluQV7467HBFHK","email":"test.user.4@example.com","phone":"62864763839","name":"Test User 4","birthdate":"1991-02-27","gender":"f","location":"Indonesia","status":1,"createdAt":"2019-08-01T10:59:00.000Z","appID":2,"deviceID":"e847d17a-68a5-4819-9061-5487072333ee","serial_number":"123444"}]');
        RestContext.request = reqNew;
        RestContext.response = resNew;
        AccountRestApi.bulkupdate();

        // Test.stopTest();

        // assert the data
        acctList = [SELECT Id, Name FROM Account];
        System.assertEquals(2, acctList.size());
        idx = 3;
        // Integer currUser = 0;
        for(Account acct: acctList){
            // currUser = idx + 1;
            System.assertEquals('Test User '+String.valueOf(idx), acct.Name);
            idx = idx + 1;
        }

        // Test.startTest();
        reqNew = new RestRequest(); 
        resNew = new RestResponse();
        reqNew.requestURI = '/services/apexrest/account/bulkdelete'; 
        //req.params.put('phoneNumber', '9876543210');
        //req.params.put('claimNumber', '111111');
        reqNew.httpMethod = 'DELETE';
        reqNew.addHeader('Content-Type', 'application/json'); 
        reqNew.requestBody = Blob.valueOf('[{"uid":"x0dLIbTUbk8jHY3xZIluQV1q6sEyTI"},{"uid":"x0dLIbTUbk8jHY3xZIluQV7467HBFHK"},{"uid":"x0dLIbTUbk8jHY3xZIluQV1q6sEy"}]');
        RestContext.request = reqNew;
        RestContext.response = resNew;
        AccountRestApi.bulkdelete();

        Test.stopTest();

        // assert the data
        acctList = [SELECT Id, Name FROM Account];
        System.assertEquals(0, acctList.size());

        // call the wrapper
        Date v1 = Date.newInstance(1980, 8, 1);
        DateTime v2 = DateTime.newInstance(2019, 8, 1, 10, 8, 16);
        AccountRestApi.DataObj wrap = new AccountRestApi.DataObj('x0dLIbTUbk8jHY3xZIluQV1q6sEyTI', 'test.user.1@example.com', '6284784388', 'Test User 1', v1, 'm', 'Indonesia', 1, v2, 2, 'e847d17a-68a5-4819-9061-5487072333ed', '123456');
        
    }
}