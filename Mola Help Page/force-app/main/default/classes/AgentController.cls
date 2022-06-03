public with sharing class AgentController {
    private static String CURRENT_USER_ID = UserInfo.getUserId();
	// private static String CURRENT_USER_ID = '0052v00000ahxVHAAY';
    
    public class WorkingAgent {
        @AuraEnabled public List<String> agentList;
        @AuraEnabled public string currentAgent;
        public WorkingAgent() {
            agentList = new List<String>();
            currentAgent = '';
        }
    }

    @AuraEnabled
    public static String getWorkingAgents(Id caseId){
        String response = '';
        WorkingAgent wa = new WorkingAgent();
        try {
            User ag = [SELECT Id, Name, Agent_List__c FROM User
                  	WHERE Id = :CURRENT_USER_ID];
            List<String> agentList = ag.Agent_List__c.split(';');
            system.debug('list >> '+agentList);
            system.debug('length >> '+agentList.size());
            wa.agentList = agentList;
        }
        catch(Exception e) {
            system.debug('Error exception >> ' + e.getMessage());
        }
        try {
            Case ca = [SELECT Id, Agent_Name__c FROM Case 
                        WHERE Id = :caseId];
            wa.currentAgent = ca.Agent_Name__c;
        }
        catch(Exception e) {
            system.debug('Error exception >> ' + e.getMessage());
        }
        system.debug(wa);
        response = JSON.serialize(wa);
        return response;
    }
    
    @AuraEnabled
    public static String setWorkingAgent(Id inputId, String agentName){
        Id caseId;
        String response = '';
        Boolean isLiveChat = false;
        // if the inputId is LiveChatTranscript, then get the CaseId
        try {
            LiveChatTranscript lat = [SELECT Id, CaseId FROM LiveChatTranscript WHERE Id = :inputId];
            caseId = lat.CaseId;
            isLiveChat = true;
        }
        catch(Exception e){
            caseId = inputId;
        }
        
        if(!isLiveChat){
            // if the inputId is MessagingSession, then get the CaseId
            try {
                MessagingSession lat = [SELECT Id, CaseId FROM MessagingSession WHERE Id = :inputId];
                caseId = lat.CaseId;
            }
            catch(Exception e){
                caseId = inputId;
            }
        }

        try{
            Case checkStatusBefore = [SELECT Id, Status, OwnerId, Owner.Name FROM Case WHERE Id = :caseId];
            if(CURRENT_USER_ID == checkStatusBefore.OwnerId){
                String newStatus = checkStatusBefore.Status == 'New' ? 'Assigned' : checkStatusBefore.Status;

                Case ca = new Case(Id = caseId, Agent_Name__c = agentName, Status = newStatus);
                update ca;
                response = '{"status": "OK", "message": "Set agent done."}';
            }
            else {
                response = '{"status": "NOK", "message": "This case already owned by '+checkStatusBefore.Owner.Name+'. Only case owner can update this case."}';
            }
        }
        catch(Exception e){
            response = '{"status": "NOK", "message": '+e.getMessage()+'}';
        }

        return response;
    }
}