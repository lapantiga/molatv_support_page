global class calculateIsInsideBusinessHours {

    global class request
    {
        @InvocableVariable (label='Date' required = true)
        global DateTime givenDateTime;
        @InvocableVariable (label='Business Hours Id' required = true)
        global String businessHoursId;
    }

    global class response
    {
        @InvocableVariable (label='Is within Business Hours?')
        global Boolean dateInsideBusinessHours;
    }

    @InvocableMethod(label='Professor Flow | Calculate if date inside Business Hours' description='Returns true if the specified target date occurs within business hours. Holidays are included in the calculation.')
    global static List<response> DateInBusHours (List<request> inputParams)
    {
        //initialize response
        List<response> responseList = new List<response>();
        Boolean checkResult;
        if(inputParams != null && inputParams.size()> 0)
        {
            for(request pf : inputParams)
            {
                checkResult = BusinessHours.isWithin(pf.businessHoursId, pf.givenDateTime);
                response rs = new response();
                rs.dateInsideBusinessHours = checkResult;
                responseList.add(rs);
            }
        }
        return responseList;
    }
}