@isTest
public class MockupSetupTest {
    @isTest
    public static void setupUsers() {
        Profile profileSysadmin = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        User user1 = new User();
        user1.ProfileId = profileSysadmin.Id;
        user1.LastName = 'Test User 1';
        user1.Email = 'user1@test.com';
        user1.Username = 'user1@test.com' + System.currentTimeMillis();
        user1.CompanyName = 'SSTV';
        user1.Title = 'Title';
        user1.Alias = 'Alias';
        user1.TimeZoneSidKey = 'Asia/Jakarta';
        user1.EmailEncodingKey = 'UTF-8';
        user1.LanguageLocaleKey = 'en_US';
        user1.LocaleSidKey = 'en_US';
        user1.Agent_List__c = 'Achmad Sybramalisi;Arif Haris Nugroho;Ahmad Baihaqi';
        
        insert user1;
    }
    
    public static void createContact() {
        User userTest = [SELECT Id FROM User WHERE Email = 'user1@test.com'];
        System.runAs(userTest){
            Integer totalContact = 2;
            List<Contact> conList = new List<Contact>();
            for(Integer i=0; i<totalContact; i++){
                String iStr = String.valueOf(i);
                conList.add(new Contact(LastName='Test Contact '+iStr, Email='test.user.'+iStr+'@example.com'));
            }

            insert conList;
        }
    }

    public static void createCase() {
        User userTest = [SELECT Id FROM User WHERE Email = 'user1@test.com'];
        System.runAs(userTest){
            Integer totalCase = 2;
            List<Case> caseList = new List<Case>();
            List<Contact> conList = [SELECT Id, Name FROM Contact];
            for(Integer i=0; i<totalCase; i++){
                String iStr = String.valueOf(i);
                caseList.add(new Case(
                                Status = 'New',
                                ContactId = conList[i].Id,
                                Origin = 'Test Class',
                                Subject = 'Subject '+iStr,
                                Description = 'Description '+iStr,
                                SuppliedEmail = 'sender'+iStr+'@test.com'
                            )
                );
            }

            insert caseList;
        }
    }

}