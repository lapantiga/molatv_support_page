@isTest
global class calculateIsInsideBusinessHoursTest 
{
    @isTest static void CheckDateInsideBusinessHours()
    {
        // Implement test code
        Profile sysadminprofile = [select Id, name from profile where Name = 'System administrator' limit 1];
        user adminUser = [select Id, Name from user where profileId= :sysadminprofile.Id  and isactive= True limit 1];
        businessHours bhoursId = [select Id from BusinessHours where name='Default' limit 1];
        System.runAs(adminUser)
        {
            List<calculateIsInsideBusinessHours.request> inputparams = new List<calculateIsInsideBusinessHours.request>();
            calculateIsInsideBusinessHours.request pf = new calculateIsInsideBusinessHours.request();
            pf.givendateTime = Datetime.now();
            pf.businessHoursId = bhoursId.Id;
            inputparams.add(pf);
            Test.startTest();
            List<calculateIsInsideBusinessHours.response> response = calculateIsInsideBusinessHours.DateInBusHours(inputParams);
            Test.stopTest();
            system.assertEquals(true, response[0].dateInsideBusinessHours);            
        }
        
    }
    
}