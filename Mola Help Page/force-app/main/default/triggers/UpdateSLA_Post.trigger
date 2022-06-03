trigger UpdateSLA_Post on SocialPost (after insert) {
    List<SocialPost> socialP = new List<SocialPost>();
    List<Case> updatedCase = new List<Case>();
    
    for(SocialPost socP : trigger.new) {
        if(socP.IsOutbound == true) {
            string sla = '';
            
            List<SocialPost> sp = [SELECT Id,CreatedDate,IsOutbound,Name,ParentId FROM SocialPost 
                                WHERE ParentId = :socP.ParentId 
                                ORDER BY CreatedDate ASC NULLS FIRST];
            System.debug('sp size '+sp.size());
            if(sp.size() == 2) {
                Case cs = [SELECT Id,AccountId,CaseNumber,SLA_First_Response__c, SuppliedEmail FROM Case 
                    WHERE Id = :socP.ParentId];
                sla = DateHelper.diffTwoDates(sp[0].CreatedDate, sp[1].CreatedDate);
                Integer slaInSecond = DateHelper.diffTwoDatesInSecond(sp[0].CreatedDate, sp[1].CreatedDate);

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