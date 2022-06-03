trigger SetPeriodName on AssessmentPeriod__c (before insert,before update) {
    // AssessmentPeriodController apCtrl = new AssessmentPeriodController();

    Map<Integer, String> mapString = new Map<Integer, String> {
                1 => 'Januari', 
                2 => 'Februari',
                3 => 'Maret',
                4 => 'April',
                5 => 'Mei',
                6 => 'Juni',
                7 => 'Juli',
                8 => 'Agustus',
                9 => 'September',
                10 => 'Oktober',
                11 => 'November',
                12 => 'Desember'};
    
    Map<ID, Schema.RecordTypeInfo> typeName = Schema.SObjectType.AssessmentPeriod__c.getRecordTypeInfosById();
    
    if(Trigger.isBefore){
        for(AssessmentPeriod__c ap: Trigger.New){
            ap.name =  ap.Agent_Name__c+' - '+ mapString.get(ap.Start_Date__c.month())+' '+ap.Start_Date__c.year()+' - '+typeName.get(ap.RecordTypeId).getName();
        }
        // if(Trigger.isInsert){
        //     apCtrl.handleTrigger(Trigger.New);
        // }
        // if(Trigger.isUpdate){
        //     apCtrl.handleTrigger(Trigger.Old, Trigger.New);
        // }
    }
   
}