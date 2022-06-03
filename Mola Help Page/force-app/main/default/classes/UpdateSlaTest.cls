@isTest
public with sharing class UpdateSlaTest {
    @isTest
    public static void testEmail() {
        MockupSetupTest.setupUsers();
        MockupSetupTest.createContact();
        MockupSetupTest.createCase();
        // create email message
        Case cs = [SELECT Id, CaseNumber FROM Case WHERE Subject='Subject 0'];
        // create email from customer
        EmailMessage em1 = new EmailMessage();
        em1.FromAddress = 'sender1@test.com';
        em1.FromName = 'Sender 1';
        em1.Incoming = true;
        em1.ParentId = cs.Id;
        em1.Subject = 'Test Case 1';
        em1.ToAddress = 'user1@test.com';
        
        insert em1;
        
        // create email reply from
        EmailMessage em2 = new EmailMessage();
        em2.FromAddress = 'user1@test.com';
        em2.FromName = 'Test User 1';
        em2.Incoming = false;
        em2.ParentId = cs.Id;
        em2.Subject = 'RE: Test Case 1';
        em2.ToAddress = 'sender0@test.com';
        em2.ReplyToEmailMessageId = em1.Id;
        
        insert em2;
    }

    @isTest
    public static void testSocialPost() {
        MockupSetupTest.setupUsers();
        MockupSetupTest.createContact();
        MockupSetupTest.createCase();
        // create email message
        Case cs = [SELECT Id, CaseNumber FROM Case WHERE Subject='Subject 0'];
        // create email from customer
        SocialPost sp1 = new SocialPost();
        sp1.Content = 'Saya ingin bertanya';
        sp1.IsOutbound = false;
        sp1.MediaType = 'Twitter';
        sp1.Name = 'Tweet From: ';
        sp1.ParentId = cs.Id;
        
        insert sp1;
        
        // create email reply from
        SocialPost sp2 = new SocialPost();
        sp2.Content = 'Saya ingin bertanya';
        sp2.IsOutbound = true;
        sp2.MediaType = 'Twitter';
        sp2.Name = 'Tweet From: ';
        sp2.ParentId = cs.Id;
        sp2.ReplyToId = sp1.Id;
        
        insert sp2;
    }
}