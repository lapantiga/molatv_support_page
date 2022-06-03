trigger UpdateSLA_Email on EmailMessage (after insert) {
    // List<EmailMessage> em = new List<EmailMessage>();
    List<Case> updatedCase = new List<Case>();

    Datetime firstCreated;
    Datetime currentCreated;
    string sla = '';
    
    for(EmailMessage mesg : trigger.new) {
        System.debug('mesg.ParentID '+mesg.ParentID);
        if(!mesg.Incoming && mesg.ReplyToEmailMessageId != null) {
            Case cs = [SELECT Id,AccountId,CaseNumber,ContactEmail,ContactId,ContactMobile,SLA_First_Response__c, ContactPhone,Origin,SuppliedEmail FROM Case 
                    WHERE Id = :mesg.ParentId];
            system.debug('suppliedEmail >> '+cs.SuppliedEmail);
            system.debug('mesg.ToAddress >> '+mesg.ToAddress);
            system.debug('SLA_First_Response__c >> '+cs.SLA_First_Response__c);
            if(cs.SuppliedEmail == mesg.ToAddress && (cs.SLA_First_Response__c == '' || cs.SLA_First_Response__c == null)){
                EmailMessage em = [SELECT Id, Incoming, ToAddress, ParentId, CreatedDate FROM EmailMessage 
                        WHERE ParentId = :mesg.ParentID ORDER BY CreatedDate ASC NULLS FIRST LIMIT 1];

                firstCreated = em.CreatedDate;
                currentCreated = mesg.CreatedDate;

                sla = DateHelper.diffTwoDates(firstCreated, currentCreated);
                Integer slaInSecond = DateHelper.diffTwoDatesInSecond(firstCreated, currentCreated);
                
                updatedCase.add(new Case(
                    Id= cs.Id,
                    SLA_First_Response__c= sla,
                    SLA_First_Response_Time__c = slaInSecond
                ));
                
            }
        }
    }

    update updatedCase;
}