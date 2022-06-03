public with sharing class AssessmentExport {
    private final AssessmentPeriod__c rec;
    public String filename {get;set;}
    public AssessmentPeriod__c apInfo {get;set;}
    public String period {get;set;}
    public List<Assessment__c> asList {get;set;}

    public AssessmentExport(ApexPages.StandardController stdController) {
        this.rec = (AssessmentPeriod__c)stdController.getRecord();
        system.debug(this.rec);
    }

    public Pagereference convert(){
        RecordType recName = [SELECT DeveloperName FROM RecordType WHERE Id=:this.rec.RecordTypeId];
        system.debug(recName);
        String excelPage = '';
        if(recName.DeveloperName == 'Live_Chat'){
            excelPage = 'ExcelLiveChat';
        }
        else if(recName.DeveloperName == 'Social_Media_Email'){
            excelPage = 'ExcelSocialMediaEmail';
        }
        Pagereference pgExcel = new Pagereference('/apex/'+excelPage);
        pgExcel.setRedirect(true);
        pgExcel.getParameters().put('apId', this.rec.Id);
        return pgExcel;
    }

    public void excelSocmedEmail(){
        Id assesstmentPeriodId = ApexPages.currentPage().getParameters().get('apId');
        system.debug('id : ' +assesstmentPeriodId);
        
        apInfo = [SELECT Id, Name, Agent_Name__c, RecordType.Name, Start_Date__c, End_Date__c, Average_Score__c, Total_Case__c, Reviewer__c FROM AssessmentPeriod__c WHERE Id= :assesstmentPeriodId];
        String tmpName = apInfo.Name;
        tmpName = tmpName.replace(' - ', '_');
        tmpName = tmpName.replace(' + ', '_');
        filename = tmpName.replaceAll('[ +]', '_');
        
        Date startDate = apInfo.Start_Date__c;
        Date endDate = apInfo.End_Date__c;
        period = startDate.format() + ' - ' + endDate.format();

        asList = [SELECT Id, Respon_Time_Evaluation__c, Respon_Time_Point__c, Respon_Time_Score__c, Information_Accuracy_Evaluation__c, Information_Accuracy_Point__c, Information_Accuracy_Score__c, Courtesy__c, Courtesy_Point__c, Courtesy_Score__c, Subject_Custom__c, Total_Score__c, Remarks_Pujian__c, Score_and_Remarks_Pujian__c, Case_Number__r.CaseNumber, Case_Number__r.Subject, Case_Number__r.CreatedDate, Ketidaksesuaian__c, Alasan__c
        FROM Assessment__c
        WHERE Assessment_Period__c = :assesstmentPeriodId];
    }

    public void excelLiveChat(){
        Id assesstmentPeriodId = ApexPages.currentPage().getParameters().get('apId');
        
        apInfo = [SELECT Id, Name, Agent_Name__c, RecordType.Name, Start_Date__c, End_Date__c, Average_Score__c, Total_Case__c, Reviewer__c FROM AssessmentPeriod__c WHERE Id= :assesstmentPeriodId];
        String tmpName = apInfo.Name;
        tmpName = tmpName.replace(' - ', '_');
        tmpName = tmpName.replace(' + ', '_');
        filename = tmpName.replaceAll('[ +]', '_');
        
        Date startDate = apInfo.Start_Date__c;
        Date endDate = apInfo.End_Date__c;
        period = startDate.format() + ' - ' + endDate.format();

        asList = [SELECT Id, Case_Number__r.CaseNumber, Case_Number__r.Subject, Case_Number__r.CreatedDate, Total_Score__c, Remarks_Pujian__c, Score_and_Remarks_Pujian__c, Ketidaksesuaian__c, Alasan__c, Salam_Pembuka_Evaluation__c, Salam_Pembuka_Point__c, Salam_Pembuka_Score__c, First_Response_Next_Response_Evaluation__c, First_Response_Next_Response__c, First_Response_Next_Response_Score__c, Sapa_Nama_Pemilik_Akun_Evaluation__c, Sapa_Nama_Pemilik_Akun_Point__c, Sapa_Nama_Pemilik_Akun_Score__c, Penggunaan_Bahasa_Singkatan_Evaluation__c, Penggunaan_Bahasa_Singkatan_Point__c, Penggunaan_Bahasa_Singkatan_Score__c, Penggunaan_Jargon__c, Penggunaan_Jargon_Point__c, Penggunaan_Jargon_Score__c, Empati_Evaluation__c, Empati_Point__c, Empati_Score__c, Gali_Info_Evaluation__c, Gali_Info_Point__c, Gali_Info_Score__c, Analisa_Permasalahan_Evaluation__c, Analisa_Permasalahan_Point__c, Analisa_Permasalahan_Score__c, Memberikan_Solusi_Evaluation__c, Memberikan_Solusi_Point__c, Memberikan_Solusi_Score__c, Menjawab_Semua_Pertanyaan_Evaluation__c, Menjawab_Semua_Pertanyaan_Point__c, Menjawab_Semua_Pertanyaan_Score__c, Lakukan_Pencatatan_Evaluation__c, Lakukan_Pencatatan_Point__c, Lakukan_Pencatatan_Score__c, Maintenance_Chat_Evaluation__c, Maintenance_Chat_Point__c, Maintenance_Chat_Score__c, Salam_Penutup_Evaluation__c, Salam_Penutup_Point__c, Salam_Penutup_Score__c, Subject_Custom__c
        FROM Assessment__c
        WHERE Assessment_Period__c = :assesstmentPeriodId];
    }
}