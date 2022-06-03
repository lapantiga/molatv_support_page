public with sharing class GeneratePDF_C {
    public AssessmentPeriod__c assper {get;set;}
    public string recId {get;set;}
    public string nameperiod {get;set;}
    public string agentname {get;set;}
    public string reviewer {get;set;}
    public Decimal totalscore {get;set;}
    public Decimal totalcase {get;set;}
    public Decimal average {get;set;}
    public string recordtype {get;set;}
    public date startdate {get;set;}
    public date enddate {get;set;}
    public String myStart {get;set;}
    public String myEnd {get;set;}
    public date createdate {get;set;}
    
    public List<Assessment__c> assesment {get;set;}
    public string ass_name {get;set;}
    public Decimal remarks {get;set;}
    public Decimal total {get;set;}
    public String tidak_sesuai {get;set;}
    public String alasan {get;set;}
    public String case_number {get;set;}
    public String sub_custom {get;set;}
    public String external {get;set;}
    public String asses_period {get;set;}
    public Decimal score_remarks {get;set;}
    public String rectype {get;set;}
    public String agent_name {get;set;}
    public String respon_eval {get;set;}
    public Decimal respon_time {get;set;}
    public Decimal respon_score {get;set;}
    public String info_eval {get;set;}
    public Decimal info_point {get;set;}
    public Decimal info_score {get;set;}
    public String court_eval {get;set;}
    public Decimal court_point {get;set;}
    public Decimal court_score {get;set;}
    public String salam_pembuka {get;set;}
    public Decimal salam_point {get;set;}
    public Decimal salam_score {get;set;}
    public String FR_eval {get;set;}
    public Decimal FR_point {get;set;}
    public Decimal FR_score {get;set;}
    public String sapa_eval {get;set;}
    public Decimal sapa_point {get;set;}
    public Decimal sapa_score {get;set;}
    public String PB_eval {get;set;}
    public Decimal PB_point {get;set;}
    public Decimal PB_score {get;set;}
    public String PJ_eval {get;set;}
    public Decimal PJ_point {get;set;}
    public Decimal PJ_score {get;set;}
    public String Emp_eval {get;set;}
    public Decimal Emp_point {get;set;}
    public Decimal Emp_score {get;set;}
    public String GI_eval {get;set;}
    public Decimal GI_point {get;set;}
    public Decimal GI_score {get;set;}
    public String AP_eval {get;set;}
    public Decimal AP_point {get;set;}
    public Decimal AP_score {get;set;}
    public String MS_eval {get;set;}
    public Decimal MS_point {get;set;}
    public Decimal MS_score {get;set;}
    public String MSP_eval {get;set;}
    public Decimal MSP_point {get;set;}
    public Decimal MSP_score {get;set;}
    public String LP_eval {get;set;}
    public Decimal LP_point {get;set;}
    public Decimal LP_score {get;set;}
    public String MC_eval {get;set;}
    public Decimal MC_point {get;set;}
    public Decimal MC_score {get;set;}
    public String SP_eval {get;set;}
    public Decimal SP_point {get;set;}
    public Decimal SP_score {get;set;}
    
    public GeneratePDF_C(ApexPages.StandardController controller){
        recId  = ApexPages.CurrentPage().getparameters().get('id');
    }
    
    public Pagereference getData(){
        
        assper = new AssessmentPeriod__c();
        assper = [select id, Agent_Name__c, Average_Score__c, Reviewer__c, End_Date__c, Name, Start_Date__c, Total_Case__c, Total_Score_Summary__c, RecordType.Name
                  from AssessmentPeriod__c where id =: recId];
        nameperiod = assper.Name;
        agentname = assper.Agent_Name__c;
        reviewer = assper.Reviewer__c;
        totalscore = assper.Total_Score_Summary__c;
        totalcase = assper.Total_Case__c;
        average = assper.Average_Score__c;
        recordtype = assper.RecordType.Name;
        startdate = Date.valueOf(assper.Start_Date__c);
        enddate = Date.valueOf(assper.End_Date__c);
        myStart = startdate.format();
        myEnd = enddate.format();
        
        assesment = new List<Assessment__c>();
        assesment = [select Name, Remarks_Pujian__c, CreatedDate, Total_Score__c, Case_Number__r.CreatedDate, Case_Number__r.CaseNumber, Ketidaksesuaian__c, Alasan__c, Subject_Custom__c,
                     External_ID__c, Assessment_Period__r.Name, Score_and_Remarks_Pujian__c, RecordType.Name, Agent_Name__c, Respon_Time_Evaluation__c, 
                     Respon_Time_Point__c, Respon_Time_Score__c, Information_Accuracy_Evaluation__c, Information_Accuracy_Point__c, Information_Accuracy_Score__c,
                     Courtesy__c, Courtesy_Point__c, Courtesy_Score__c, Salam_Pembuka_Evaluation__c, Salam_Pembuka_Point__c, Salam_Pembuka_Score__c,
                     First_Response_Next_Response_Evaluation__c, First_Response_Next_Response__c, First_Response_Next_Response_Score__c, 
                     Sapa_Nama_Pemilik_Akun_Evaluation__c, Sapa_Nama_Pemilik_Akun_Point__c, Sapa_Nama_Pemilik_Akun_Score__c, Penggunaan_Bahasa_Singkatan_Evaluation__c,
                     Penggunaan_Bahasa_Singkatan_Point__c, Penggunaan_Bahasa_Singkatan_Score__c, Penggunaan_Jargon__c, Penggunaan_Jargon_Point__c, Penggunaan_Jargon_Score__c,
                     Empati_Evaluation__c, Empati_Point__c, Empati_Score__c, Gali_Info_Evaluation__c, Gali_Info_Point__c, Gali_Info_Score__c, 
                     Analisa_Permasalahan_Evaluation__c, Analisa_Permasalahan_Point__c, Analisa_Permasalahan_Score__c, Memberikan_Solusi_Evaluation__c,
                     Memberikan_Solusi_Point__c, Memberikan_Solusi_Score__c, Menjawab_Semua_Pertanyaan_Evaluation__c, Menjawab_Semua_Pertanyaan_Point__c,
                     Menjawab_Semua_Pertanyaan_Score__c, Lakukan_Pencatatan_Evaluation__c, Lakukan_Pencatatan_Point__c, Lakukan_Pencatatan_Score__c, 
                     Maintenance_Chat_Evaluation__c, Maintenance_Chat_Point__c, Maintenance_Chat_Score__c, Salam_Penutup_Evaluation__c, Salam_Penutup_Point__c, Salam_Penutup_Score__c
                     from Assessment__c where Assessment_Period__c =: assper.id];
        system.debug('assessment ID ' +assesment);
        for(Assessment__c asses : assesment){
            //string recordtypename = Schema.SObjectType.Assessment__c.getRecordTypeInfosById().get(asses.recordtypeid).getname();
            if(asses.RecordType.Name == 'Social Media + Email'){
                ass_name = asses.Name;
                total = asses.Total_Score__c;
                remarks = asses.Remarks_Pujian__c;
                case_number = asses.Case_Number__r.CaseNumber;
                sub_custom = asses.Subject_Custom__c;
                createdate = Date.valueOf(asses.Case_Number__r.CreatedDate);
                
                asses_period = asses.Assessment_Period__r.Name;
                score_remarks = asses.Score_and_Remarks_Pujian__c;
                rectype = asses.RecordType.Name;
                agent_name = asses.Agent_Name__c;
                
                respon_eval = asses.Respon_Time_Evaluation__c;
                respon_time = asses.Respon_Time_Point__c;
                respon_score = asses.Respon_Time_Score__c;
                info_eval = asses.Information_Accuracy_Evaluation__c;
                info_point = asses.Information_Accuracy_Point__c;
                info_score = asses.Information_Accuracy_Score__c;
                court_eval = asses.Courtesy__c;
                court_point = asses.Courtesy_Point__c;
                court_score = asses.Courtesy_Score__c;
            }
            else if(asses.RecordType.Name == 'Live Chat'){
                ass_name = asses.Name;
                total = asses.Total_Score__c;
                remarks = asses.Remarks_Pujian__c;
                tidak_sesuai = asses.Ketidaksesuaian__c;
                alasan = asses.Alasan__c;
                case_number = asses.Case_Number__r.CaseNumber;
                sub_custom = asses.Subject_Custom__c;
                external = asses.External_ID__c;
                asses_period = asses.Assessment_Period__r.Name;
                score_remarks = asses.Score_and_Remarks_Pujian__c;
                rectype = asses.RecordType.Name;
                agent_name = asses.Agent_Name__c;
                createdate = Date.valueOf(asses.Case_Number__r.CreatedDate);
                
                salam_pembuka = asses.Salam_Pembuka_Evaluation__c;
                salam_point = asses.Salam_Pembuka_Point__c;
                salam_score = asses.Salam_Pembuka_Score__c;
                FR_eval = asses.First_Response_Next_Response_Evaluation__c;
                FR_point = asses.First_Response_Next_Response__c;
                FR_score = asses.First_Response_Next_Response_Score__c;
                sapa_eval = asses.Salam_Pembuka_Evaluation__c;
                sapa_point = asses.Salam_Pembuka_Point__c;
                sapa_score = asses.Salam_Pembuka_Score__c;
                PB_eval = asses.Penggunaan_Bahasa_Singkatan_Evaluation__c;
                PB_point = asses.Penggunaan_Bahasa_Singkatan_Point__c;
                PB_score = asses.Penggunaan_Bahasa_Singkatan_Score__c;
                PJ_eval = asses.Penggunaan_Jargon__c;
                PJ_point = asses.Penggunaan_Jargon_Point__c;
                PJ_score = asses.Penggunaan_Jargon_Score__c;
                Emp_eval = asses.Empati_Evaluation__c;
                Emp_point = asses.Empati_Point__c;
                Emp_score = asses.Empati_Score__c;
                GI_eval = asses.Gali_Info_Evaluation__c;
                GI_point = asses.Gali_Info_Point__c;
                GI_score = asses.Gali_Info_Score__c;
                AP_eval = asses.Analisa_Permasalahan_Evaluation__c;
                AP_point = asses.Analisa_Permasalahan_Point__c;
                AP_score = asses.Analisa_Permasalahan_Score__c ;
                MS_eval = asses.Memberikan_Solusi_Evaluation__c;
                MS_point = asses.Memberikan_Solusi_Point__c;
                MS_score = asses.Memberikan_Solusi_Score__c;
                MSP_eval = asses.Menjawab_Semua_Pertanyaan_Evaluation__c;
                MSP_point = asses.Menjawab_Semua_Pertanyaan_Point__c;
                MSP_score = asses.Menjawab_Semua_Pertanyaan_Score__c;
                LP_eval = asses.Lakukan_Pencatatan_Evaluation__c;
                LP_point = asses.Lakukan_Pencatatan_Point__c;
                LP_score = asses.Lakukan_Pencatatan_Score__c;
                MC_eval = asses.Maintenance_Chat_Evaluation__c;
                MC_point = asses.Maintenance_Chat_Point__c;
                MC_score = asses.Maintenance_Chat_Score__c;
                SP_eval = asses.Salam_Penutup_Evaluation__c;
                SP_point = asses.Salam_Penutup_Point__c;
                SP_score = asses.Salam_Penutup_Score__c;
            }
        }
        return null;
    }
}