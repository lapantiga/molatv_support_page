@isTest
public with sharing class WorkingAgentTest {
    public static void initTest(){
        MockupSetupTest.setupUsers();
        MockupSetupTest.createContact();
        MockupSetupTest.createCase();
    }

    @isTest
    public static void testGetWorkAgents() {
        initTest();
        User userTest = [SELECT Id FROM User WHERE Email = 'user1@test.com'];
        System.runAs(userTest){
            List<Case> caList = [SELECT Id, Subject FROM Case ORDER BY Subject];
            Integer idx = 0;
            for(Case ca: caList){
                system.assertEquals('Subject '+String.valueOf(idx), ca.Subject);
                String req = AgentController.getWorkingAgents(ca.Id);
                JSONParser parser = JSON.createParser(req);
                while (parser.nextToken() != null) {
                    system.debug('field name >> '+parser.getCurrentToken());
                    system.debug('text >> '+parser.getText());
                }
                idx = idx + 1;
            }
        }

    }

    @isTest
    public static void testSetWorkAgent() {
        initTest();
        User userTest = [SELECT Id FROM User WHERE Email = 'user1@test.com'];
        System.runAs(userTest){
            List<Case> caList = [SELECT Id, Subject FROM Case ORDER BY Subject];
            Integer idx = 0;
            for(Case ca: caList){
                system.assertEquals('Subject '+String.valueOf(idx), ca.Subject);
                String req = AgentController.setWorkingAgent(ca.Id, 'Achmad');
                // JSONParser parser = JSON.createParser(req);
                // while (parser.nextToken() != null) {
                //     system.debug('field name >> '+parser.getCurrentToken());
                //     system.debug('text >> '+parser.getText());
                // }
                idx = idx + 1;
            }
        }

    }
}