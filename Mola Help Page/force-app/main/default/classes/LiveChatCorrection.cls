global class LiveChatCorrection implements Schedulable {
    global void execute(SchedulableContext ctx){
        checkNeedCorrection();
    }

    public static void checkNeedCorrection(){
        Set<Id> caseIdSet = new Set<Id>();
        // cek jika ada case yang SLA first response = empty/null
        List<Case> nullSlaList = [SELECT Id, SLA_First_Response_Time__c FROM Case
                            WHERE Status = 'Done' AND SLA_First_Response_Time__c = null
                                AND Id IN (SELECT CaseId FROM LiveChatTranscript WHERE Status = 'Completed')];
        // cek di livechat, jika ada relasi maka hitung SLA-nya dan update origin-nya
        for(Case csSla: nullSlaList){
            System.debug('cs >> '+csSla);
            caseIdSet.add(csSla.Id);
        }

        if(caseIdSet.size() > 0)
            setSlaTime(caseIdSet);
    }

    public static void setSlaTime(Set<Id> caseIdSet){
        List<Case> updateCaseList = new List<Case>();

        List<LiveChatTranscript> lctList = [SELECT Id, Body, CaseId, Browser FROM LiveChatTranscript 
                                            WHERE CaseId IN :caseIdSet];
        String originStr = 'Web'; // default is Web for live chat
        for(LiveChatTranscript lct: lctList){
            // set origin string
            if(lct.Browser == 'Unknown null')
                originStr = 'Mobile App';
            
            String strTmp = lct.Body;
            List<String> lst = strTmp.split('</p>');
            system.debug(lst);
            String chatTmp = '';
            for(String str: lst){
                if(str.contains('s )'))
                    chatTmp = str;
            }
            system.debug(chatTmp);
            List<String> chatList = chatTmp.split('<br>');

            List<Integer> timeList = new List<Integer>();
            Integer slaSecond = 0;
            String slaString = '0s';
            system.debug('Size chat list >> '+chatList.size());
            system.debug('Chat list >> '+chatList);
            
            for(String cht: chatList){
                system.debug('break chat list >> '+cht);
                // if(cht != '') {
                    Integer tmpTime = cht.indexOf('s )');
                    Integer tmpIsAgent = cht.indexOf('U:');
                    if(tmpTime != -1 && tmpIsAgent != -1){
                        slaString = cht.substring(2, tmpTime + 1);
                        system.debug('slaString >> '+slaString);
                        slaSecond = DateHelper.convertTimeStringToInteger(slaString);
                        system.debug('slaSecond >> '+slaSecond);
                        break;
                    }
                // }
            }
            updateCaseList.add(new Case(
                Id = lct.CaseId,
                SLA_First_Response_Time__c = slaSecond,
                SLA_First_Response__c = slaString,
                Origin = originStr
            ));
            system.debug('updateCaseList >> '+updateCaseList);
        }
        update updateCaseList;
    }
}