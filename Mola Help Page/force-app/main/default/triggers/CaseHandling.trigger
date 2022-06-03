trigger CaseHandling on Case (before insert, before update, after insert, after update) {
    List<Case> updateCaseList = new List<Case>();

    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            // update priority
            UserRole ur = [select Id, name, developername from userrole WHERE DeveloperName='Agent'];
            for(Integer i=0; i<trigger.new.size(); i++) {
                if((Trigger.old[i].Status != 'Done') && (Trigger.new[i].Status == 'Pending') && (Trigger.new[i].Priority == 'Medium')) {
                    Trigger.new[i].Priority = 'High';
                }
                // if((Trigger.old[i].Owner.UserRoleId != Trigger.new[i].Owner.UserRoleId) && (Trigger.new[i].Owner.UserRoleId == ur.Id) && (Trigger.new[i].Status == 'New')){
                //     Trigger.new[i].Status = 'Assigned';
                // }
            }
        }
    }
}