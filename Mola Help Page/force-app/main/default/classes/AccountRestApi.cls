@RestResource(urlMapping='/account/*')
global with sharing class AccountRestApi {
    @HttpPut
    global static void bulkinsert(){
        Map<String, Account> mapExistingUid = new Map<String, Account>();
        for(Account acct: [SELECT Id, UID__c from Account]){
            mapExistingUid.put(acct.UID__c, acct);
        }

        RestRequest req = RestContext.request;
        
        Blob jsonFile = req.requestBody;
        String jsonString = jsonFile.toString();
        JSONParser parser = JSON.createParser(jsonString);
        
        List<Account> acctList = new List<Account>();
        List<API_Log__c> apiLog = new List<API_Log__c>();
        
        Integer i = 0;
        Integer j = 0;
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() == JSONToken.START_ARRAY){
                while (parser.nextToken() != null){
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT){
                        DataObj jsonData = (DataObj)parser.readValueAs(DataObj.class);
                        
                        if(!mapExistingUid.containsKey(jsonData.uid)) {
                            acctList.add(new Account(
                                UID__c = jsonData.uid,
                                Email__c = jsonData.email,
								Phone = jsonData.phone,
                                Name = jsonData.name == '' ? jsonData.deviceID : jsonData.name,
                                Registration_Type__c = jsonData.name == '' ? 'Seamless' : 'Normal',
                                Birthdate__c = jsonData.birthdate,
                                Gender__c = jsonData.gender,
                                Location__c = jsonData.location,
                                Status__c = String.valueOf(jsonData.status),
                                External_Created_Timestamp__c = jsonData.createdAt,
                                App_ID__c = String.valueOf(jsonData.appID),
                                Device_ID__c = jsonData.deviceID,
                                Serial_Number__c = jsonData.serial_number,
                                AccountSource = 'Rest API'
                            ));
                        }
                        
                        parser.skipChildren();
                    }
                }
            }
        }
        
        Integer cnt = 0;
        Database.SaveResult[] srList = Database.insert(acctList, false);
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful
                i = i + 1;
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    apiLog.add(new Api_Log__c(
                        Name = acctList[cnt].UID__c,
                        Type__c = 'Insert Account',
                        Error_Status_Code__c = String.valueOf(err.getStatusCode()),
                        Error_Response__c = err.getMessage(),
                        Detail_Message__c = err.getMessage()+' Account fields that affected this error: ' + err.getFields()
                    ));
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
                j = j + 1;
            }

            cnt = cnt + 1;
        }
        insert apiLog;
        
        // create json response for client
        String responseStr = setResponse(apiLog, i ,j);
        
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(responseStr);
    }

    public static String setResponse(Api_Log__c[] apiLog, Integer totalSuccess, Integer totalFailed){
        // create json response for client
        JSONGenerator response = JSON.createGenerator(true);
        response.writeStartArray();
        response.writeStartObject();
          response.writeStringField('status', '200');
          response.writeNumberField('total_success_record', totalSuccess);
          response.writeNumberField('total_failed_record', totalFailed);
          response.writeFieldName('failed_record');
          response.writeStartArray();
          for(Api_Log__c log: apiLog){
          	response.writeStartObject();
            response.writeStringField('error_code', log.Error_Status_Code__c);
            response.writeStringField('error_message', log.Detail_Message__c);
            response.writeStringField('UID', log.Name);
            response.writeEndObject();
          }
          response.writeEndArray();
        response.writeEndObject();
        response.writeEndArray();

        return response.getAsString();
    }

    public class DataObj{
        public String uid {get;set;}
        public String email {get;set;}
        public String phone {get;set;}
        public String name {get;set;}
        public Date birthdate {get;set;}
        public String gender {get;set;}
        public String location {get;set;}
        public Integer status {get;set;}
        public DateTime createdAt {get;set;}
        public Integer appID {get;set;}
        public String deviceID {get;set;}
        public String serial_number {get;set;}

        public DataObj(String inputUid, String inputEmail, String inputPhone, String inputName, Date inputBirthdate, String inputGender, String inputLoc, Integer inputStatus, DateTime inputCreated, Integer inputAppid, String inputDeviceid, String inputSerial){
            uid = inputUid;
            email = inputEmail;
            phone = inputPhone;
            name = inputName;
            birthdate = inputBirthdate;
            gender = inputGender;
            location = inputLoc;
            status = inputStatus;
            createdAt = inputCreated;
            appID = inputAppid;
            deviceID = inputDeviceid;
            serial_number = inputSerial;
        }
    }

    @HttpPatch
    global static void bulkupdate(){
        Map<String, Account> mapExistingUid = new Map<String, Account>();
        for(Account con: [SELECT Id, UID__c from Account]){
            mapExistingUid.put(con.UID__c, con);
        }

        RestRequest req = RestContext.request;
        
        Blob jsonFile = req.requestBody;
        String jsonString = jsonFile.toString();
        JSONParser parser = JSON.createParser(jsonString);
        
        List<Account> acctList = new List<Account>();
        List<API_Log__c> apiLog = new List<API_Log__c>();
        
        Integer i = 0;
        Integer j = 0;
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() == JSONToken.START_ARRAY){
                while (parser.nextToken() != null){
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT){
                        DataObj jsonData = (DataObj)parser.readValueAs(DataObj.class);

                        // checking existing uid
                        if(mapExistingUid.containsKey(jsonData.uid)){
                            system.debug('ada update');

                            acctList.add(new Account(
                                Id = mapExistingUid.get(jsonData.uid).Id,
                                Email__c = jsonData.email,
								Phone = jsonData.phone,
                                Name = jsonData.name == '' ? jsonData.deviceID : jsonData.name,
                                Registration_Type__c = jsonData.name == '' ? 'Seamless' : 'Normal',
                                Birthdate__c = jsonData.birthdate,
                                Gender__c = jsonData.gender,
                                Location__c = jsonData.location,
                                Status__c = String.valueOf(jsonData.status),
                                External_Created_Timestamp__c = jsonData.createdAt,
                                App_ID__c = String.valueOf(jsonData.appID),
                                Device_ID__c = jsonData.deviceID,
                                Serial_Number__c = jsonData.serial_number,
                                AccountSource = 'Rest API'
                            ));
                        }
                        // checking mandatory fields
                        
                        parser.skipChildren();
                    }
                }
            }
        }
        
        Integer cnt = 0;
        Database.SaveResult[] srList = Database.update(acctList, false);
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful
                i = i + 1;
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    apiLog.add(new Api_Log__c(
                        Name = acctList[cnt].UID__c,
                        Type__c = 'Update Account',
                        Error_Status_Code__c = String.valueOf(err.getStatusCode()),
                        Error_Response__c = err.getMessage(),
                        Detail_Message__c = err.getMessage()+' Account fields that affected this error: ' + err.getFields()
                    ));
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
                j = j + 1;
            }

            cnt = cnt + 1;
        }
        insert apiLog;
        
        // create json response for client
        String responseStr = setResponse(apiLog, i ,j);
        
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(responseStr);
    }

    @HttpDelete
    global static void bulkdelete(){
        Map<String, Account> mapExistingUid = new Map<String, Account>();
        for(Account con: [SELECT Id, UID__c from Account]){
            mapExistingUid.put(con.UID__c, con);
        }

        RestRequest req = RestContext.request;
        
        Blob jsonFile = req.requestBody;
        String jsonString = jsonFile.toString();
        JSONParser parser = JSON.createParser(jsonString);
        
        List<Account> acctList = new List<Account>();
        List<API_Log__c> apiLog = new List<API_Log__c>();
        
        Integer i = 0;
        Integer j = 0;
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() == JSONToken.START_ARRAY){
                while (parser.nextToken() != null){
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT){
                        DataObj jsonData = (DataObj)parser.readValueAs(DataObj.class);

                        // checking existing uid
                        if(mapExistingUid.containsKey(jsonData.uid)){

                            acctList.add(new Account(
                                Id = mapExistingUid.get(jsonData.uid).Id
                            ));
                        }
                        // checking mandatory fields
                        
                        parser.skipChildren();
                    }
                }
            }
        }
        
        //insert acctList;
        Integer cnt = 0;
        Database.DeleteResult[] srList = Database.delete(acctList, false);
        for (Database.DeleteResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful
                i = i + 1;
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    apiLog.add(new Api_Log__c(
                        Name=acctList[cnt].UID__c,
                        Type__c = 'Delete Account',
                        Error_Status_Code__c = String.valueOf(err.getStatusCode()),
                        Error_Response__c = err.getMessage(),
                        Detail_Message__c = err.getMessage()+' Account fields that affected this error: ' + err.getFields()
                    ));
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
                j = j + 1;
            }

            cnt = cnt + 1;
        }
        insert apiLog;
        
        // create json response for client
        String responseStr = setResponse(apiLog, i ,j);
        
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(responseStr);
    }
}