public with sharing class EditAllCaseController {
    @AuraEnabled
    public static Object Scoring(){
        responseFetchScoring respo = new responseFetchScoring();
        List<Scoring__c> scoreList = new List<Scoring__c>();
        scoreList = [SELECT Id, Name, Score__c, Point__c, Bobot__c, Category__c, Evaluation__c 
        FROM Scoring__c ];
        Decimal respScorePass;
        Decimal respScoreFail;
        Decimal respPointPass;
        Decimal respPointFail;
        Decimal InfoAkurScorePass;
        Decimal InfoAkurScoreFail;
        Decimal InfoAkurPointPass;
        Decimal InfoAkurPointFail;
        Decimal CourtesyScorePass;
        Decimal CourtesyScoreFail;
        Decimal CourtesyPointPass;
        Decimal CourtesyPointFail;

        Decimal SalpemScorePass;
        Decimal SalpemScoreFail;
        Decimal SalpemScoreNA;
        Decimal SalpemPointPass;
        Decimal SalpemPointFail;
        Decimal SalpemPointNA;

        Decimal FirstRespScorePass;
        Decimal FirstRespScoreFail;
        Decimal FirstRespScoreNA;
        Decimal FirstRespPointPass;
        Decimal FirstRespPointFail;
        Decimal FirstRespPointNA;

        Decimal SapaScorePass;
        Decimal SapaScoreFail;
        Decimal SapaScoreNA;
        Decimal SapaPointPass;
        Decimal SapaPointFail;
        Decimal SapaPointNA;

        Decimal PengBahasaScorePass;
        Decimal PengBahasaScoreFail;
        Decimal PengBahasaScoreNA;
        Decimal PengBahasaPointPass;
        Decimal PengBahasaPointFail;
        Decimal PengBahasaPointNA;

        Decimal PengJargonScorePass;
        Decimal PengJargonScoreFail;
        Decimal PengJargonScoreNA;
        Decimal PengJargonPointPass;
        Decimal PengJargonPointFail;
        Decimal PengJargonPointNA;
        
        Decimal EmpatiScorePass;
        Decimal EmpatiScoreFail;
        Decimal EmpatiScoreNA;
        Decimal EmpatiPointPass;
        Decimal EmpatiPointFail;
        Decimal EmpatiPointNA;
        Decimal GaliScorePass;
        Decimal GaliScoreFail;
        Decimal GaliScoreNA;
        Decimal GaliPointPass;
        Decimal GaliPointFail;
        Decimal GaliPointNA;

        Decimal AnalisScoreExcellent;
        Decimal AnalisScorePoor;
        Decimal AnalisScoreNA;

        Decimal AnalisPointExcellent;
        Decimal AnalisPointPoor;
        Decimal AnalisPointNA;

        Decimal SolusiScoreExcellent;
        Decimal SolusiScoreFail;
        Decimal SolusiScorePoor;
        Decimal SolusiScoreNA;
        Decimal SolusiPointExcellent;
        Decimal SolusiPointFail;
        Decimal SolusiPointPoor;
        Decimal SolusiPointNA;

        Decimal MenjawabScoreExcellent;
        Decimal MenjawabScoreFail;
        Decimal MenjawabScoreNA;
        Decimal MenjawabPointExcellent;
        Decimal MenjawabPointFail;
        Decimal MenjawabPointNA;

        Decimal PencatatanScoreExcellent;
        Decimal PencatatanScoreFail;
        Decimal PencatatanScoreNA;
        Decimal PencatatanPointExcellent;
        Decimal PencatatanPointFail;
        Decimal PencatatanPointNA;

        Decimal MaintenanceScoreMeetExpect;
        Decimal MaintenanceScorePoor;
        Decimal MaintenanceScoreFail;
        Decimal MaintenanceScoreNA;
        Decimal MaintenancePointMeetExpect;
        Decimal MaintenancePointPoor;
        Decimal MaintenancePointFail;
        Decimal MaintenancePointNA;
        
       
        Decimal PenutupScorePass;
        Decimal PenutupScoreFail;
        Decimal PenutupScoreNA;
        Decimal PenutupPointPass;
        Decimal PenutupPointFail;
        Decimal PenutupPointNA;
        
        String Category = '';
        for(Scoring__C scr : scoreList) {
            if(scr.Evaluation__c == 'Pass') {
                if(scr.Category__c == 'Respon Time') {
                    respScorePass = scr.Score__c;
                    respPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Information Accuracy') {
                    InfoAkurScorePass = scr.Score__c;
                    InfoAkurPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Courtesy') {
                    CourtesyScorePass = scr.Score__c;
                    CourtesyPointPass = scr.Point__c;
                }
                //Live Chat

                if(scr.Category__c == 'Salam Pembuka') {
                    SalpemScorePass = scr.Score__c;
                    SalpemPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'First Response & Next Response') {
                    FirstRespScorePass = scr.Score__c;
                    FirstRespPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Sapa Nama Pemilik Akun') {
                    SapaScorePass = scr.Score__c;
                    SapaPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Penggunaan Bahasa dan Singkatan Umum') {
                    PengBahasaScorePass = scr.Score__c;
                    PengBahasaPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Penggunaan Jargon') {
                    PengJargonScorePass = scr.Score__c;
                    PengJargonPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Empati') {
                    EmpatiScorePass = scr.Score__c;
                    EmpatiPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Gali Info') {
                    GaliScorePass = scr.Score__c;
                    GaliPointPass = scr.Point__c;
                }
                if(scr.Category__c == 'Salam Penutup') {
                    PenutupScorePass = scr.Score__c;
                    PenutupPointPass = scr.Point__c;
                }              
            }

            if(scr.Evaluation__c == 'Fail') {

                if(scr.Category__c == 'Respon Time') {
                    respScoreFail = scr.Score__c;
                    respPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Information Accuracy') {
                    InfoAkurScoreFail = scr.Score__c;
                    InfoAkurPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Courtesy') {
                    CourtesyScoreFail = scr.Score__c;
                    CourtesyPointFail = scr.Point__c;
                }

                // live chat
                if(scr.Category__c == 'Salam Pembuka') {
                    SalpemScoreFail = scr.Score__c;
                    SalpemPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'First Response & Next Response') {
                    FirstRespScoreFail = scr.Score__c;
                    FirstRespPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Sapa Nama Pemilik Akun') {
                    SapaScoreFail = scr.Score__c;
                    SapaPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Penggunaan Bahasa dan Singkatan Umum') {
                    PengBahasaScoreFail = scr.Score__c;
                    PengBahasaPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Penggunaan Jargon') {
                    PengJargonScoreFail = scr.Score__c;
                    PengJargonPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Empati') {
                    EmpatiScoreFail = scr.Score__c;
                    EmpatiPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Gali Info') {
                    GaliScoreFail = scr.Score__c;
                    GaliPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Memberikan Solusi') {
                    SolusiScoreFail = scr.Score__c;
                    SolusiPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Menjawab Semua Pertanyaan User') {
                    MenjawabScoreFail = scr.Score__c;
                    MenjawabPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Lakukan Pencatatan') {
                    PencatatanScoreFail = scr.Score__c;
                    PencatatanPointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Maintenance Chat') {
                    MaintenanceScoreFail = scr.Score__c;
                    MaintenancePointFail = scr.Point__c;
                }
                if(scr.Category__c == 'Salam Penutup') {
                    PenutupScoreFail = scr.Score__c;
                    PenutupPointFail = scr.Point__c;
                }
            }

            if(scr.Evaluation__c == 'N/A') {
                if(scr.Category__c == 'Salam Pembuka') {
                    SalpemScoreNA = scr.Score__c;
                    SalpemPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'First Response & Next Response') {
                    FirstRespScoreNA = scr.Score__c;
                    FirstRespPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Sapa Nama Pemilik Akun') {
                    SapaScoreNA = scr.Score__c;
                    SapaPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Penggunaan Bahasa dan Singkatan Umum') {
                    PengBahasaScoreNA = scr.Score__c;
                    PengBahasaPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Penggunaan Jargon') {
                    PengJargonScoreNA = scr.Score__c;
                    PengJargonPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Empati') {
                    EmpatiScoreNA = scr.Score__c;
                    EmpatiPointNA = scr.Point__c;
                }              
                if(scr.Category__c == 'Analisa Permasalahan') {
                    AnalisScoreNA = scr.Score__c;
                    AnalisPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Gali Info') {
                    GaliScoreNA = scr.Score__c;
                    GaliPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Memberikan Solusi') {
                    SolusiScoreNA = scr.Score__c;
                    SolusiPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Menjawab Semua Pertanyaan User') {
                    MenjawabScoreNA = scr.Score__c;
                    MenjawabPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Lakukan Pencatatan') {
                    PencatatanScoreNA = scr.Score__c;
                    PencatatanPointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Maintenance Chat') {
                    MaintenanceScoreNA = scr.Score__c;
                    MaintenancePointNA = scr.Point__c;
                }
                if(scr.Category__c == 'Salam Penutup') {
                    PenutupScoreNA = scr.Score__c;
                    PenutupPointNA = scr.Point__c;
                }
            }
            if(scr.Evaluation__c == 'Excellent') {
               
                if(scr.Category__c == 'Analisa Permasalahan') {
                    AnalisScoreExcellent = scr.Score__c;
                    AnalisPointExcellent = scr.Point__c;
                }
                
                if(scr.Category__c == 'Memberikan Solusi') {
                    SolusiScoreExcellent = scr.Score__c;
                    SolusiPointExcellent = scr.Point__c;
                }
                if(scr.Category__c == 'Menjawab Semua Pertanyaan User') {
                    MenjawabScoreExcellent = scr.Score__c;
                    MenjawabPointExcellent = scr.Point__c;
                }
                if(scr.Category__c == 'Lakukan Pencatatan') {
                    PencatatanScoreExcellent = scr.Score__c;
                    PencatatanPointExcellent = scr.Point__c;
                }
            }
            if(scr.Evaluation__c == 'Poor') {
               
                if(scr.Category__c == 'Analisa Permasalahan') {
                    AnalisScorePoor = scr.Score__c;
                    AnalisPointPoor = scr.Point__c;
                }
                
                if(scr.Category__c == 'Memberikan Solusi') {
                    SolusiScorePoor = scr.Score__c;
                    SolusiPointPoor = scr.Point__c;
                }
                
                if(scr.Category__c == 'Maintenance Chat') {
                    MaintenanceScorePoor = scr.Score__c;
                    MaintenancePointPoor = scr.Point__c;
                }
            }
            if(scr.Evaluation__c == 'Meet Expectation') {
               
                if(scr.Category__c == 'Maintenance Chat') {
                    MaintenanceScoreMeetExpect = scr.Score__c;
                    MaintenancePointMeetExpect = scr.Point__c;
                }
            }
        }
        //pass sosmed + email
        respo.responseScorePass = respScorePass;
        respo.responsePointPass = respPointPass;
        respo.InfoAkurScorePass = InfoAkurScorePass;
        respo.InfoAkurPointPass = InfoAkurPointPass;
        respo.CourtesyScorePass = CourtesyScorePass;
        respo.CourtesyPointPass = CourtesyPointPass;
        //fail sosmed + email
        respo.responseScoreFail = respScoreFail;
        respo.responsePointFail = respPointFail;
        respo.InfoAkurScoreFail = InfoAkurScoreFail;
        respo.InfoAkurPointFail = InfoAkurPointFail;
        respo.CourtesyScoreFail = CourtesyScoreFail;
        respo.CourtesyPointFail = CourtesyPointFail;
        // pass live chat
        respo.SalpemScorePass = SalpemScorePass;
        respo.SalpemPointPass = SalpemPointPass;
        respo.FirstRespScorePass = FirstRespScorePass;
        respo.FirstRespPointPass = FirstRespPointPass;
        respo.SapaScorePass = SapaScorePass;
        respo.SapaPointPass = SapaPointPass;
        respo.PengBahasaScorePass = PengBahasaScorePass;
        respo.PengBahasaPointPass = PengBahasaPointPass;
        respo.PengJargonScorePass = PengJargonScorePass;
        respo.PengJargonPointPass = PengJargonPointPass;
        respo.EmpatiScorePass = EmpatiScorePass;
        respo.EmpatiPointPass = EmpatiPointPass;
        respo.GaliScorePass = GaliScorePass;
        respo.GaliPointPass = GaliPointPass;
        respo.PenutupScorePass = PenutupScorePass;
        respo.PenutupPointPass = PenutupPointPass;
        // fail live chat
        respo.SalpemScoreFail = SalpemScoreFail;
        respo.SalpemPointFail = SalpemPointFail;
        respo.FirstRespScoreFail = FirstRespScoreFail;
        respo.FirstRespPointFail = FirstRespPointFail;
        respo.SapaScoreFail = SapaScoreFail;
        respo.SapaPointFail = SapaPointFail;
        respo.PengBahasaScoreFail = PengBahasaScoreFail;
        respo.PengBahasaPointFail = PengBahasaPointFail;
        respo.PengJargonScoreFail = PengJargonScoreFail;
        respo.PengJargonPointFail = PengJargonPointFail;
        respo.EmpatiScoreFail = EmpatiScoreFail;
        respo.EmpatiPointFail = EmpatiPointFail;
        respo.GaliScoreFail = GaliScoreFail;
        respo.GaliPointFail = GaliPointFail;
        respo.SolusiScoreFail = SolusiScoreFail;
        respo.SolusiPointFail = SolusiPointFail;
        respo.MenjawabScoreFail = MenjawabScoreFail;
        respo.MenjawabPointFail = MenjawabPointFail;
        respo.PencatatanScoreFail = PencatatanScoreFail;
        respo.PencatatanPointFail = PencatatanPointFail;
        respo.MaintenanceScoreFail = MaintenanceScoreFail;
        respo.MaintenancePointFail = MaintenancePointFail;
        respo.PenutupScoreFail = PenutupScoreFail;
        respo.PenutupPointFail = PenutupPointFail;
        // N/A live chat
        respo.SalpemScoreNA = SalpemScoreNA;
        respo.SalpemPointNA = SalpemPointNA;
        respo.FirstRespScoreNA  = FirstRespScoreNA ;
        respo.FirstRespPointNA  = FirstRespPointNA ;
        respo.SapaScoreNA  = SapaScoreNA ;
        respo.SapaPointNA  = SapaPointNA ;
        respo.PengBahasaScoreNA  = PengBahasaScoreNA ;
        respo.PengBahasaPointNA  = PengBahasaPointNA ;
        respo.PengJargonScoreNA  = PengJargonScoreNA ;
        respo.PengJargonPointNA  = PengJargonPointNA ;
        respo.EmpatiScoreNA = EmpatiScoreNA;
        respo.EmpatiPointNA = EmpatiPointNA;
        respo.AnalisScoreNA = AnalisScoreNA;
        respo.AnalisPointNA = AnalisPointNA;
        respo.GaliScoreNA = GaliScoreNA;
        respo.GaliPointNA = GaliPointNA;
        respo.SolusiScoreNA = SolusiScoreNA;
        respo.SolusiPointNA = SolusiPointNA;
        respo.MenjawabScoreNA = MenjawabScoreNA;
        respo.MenjawabPointNA = MenjawabPointNA;
        respo.PencatatanScoreNA = PencatatanScoreNA;
        respo.PencatatanPointNA = PencatatanPointNA;
        respo.MaintenanceScoreNA = MaintenanceScoreNA;
        respo.MaintenancePointNA = MaintenancePointNA;
        respo.PenutupScoreNA = PenutupScoreNA;
        respo.PenutupPointNA = PenutupPointNA;
        // excellent live chat
        respo.AnalisScoreExcellent = AnalisScoreExcellent;
        respo.AnalisPointExcellent = AnalisPointExcellent;
        respo.SolusiScoreExcellent = SolusiScoreExcellent;
        respo.SolusiPointExcellent = SolusiPointExcellent;
        respo.MenjawabScoreExcellent = MenjawabScoreExcellent;
        respo.MenjawabPointExcellent = MenjawabPointExcellent;
        respo.PencatatanScoreExcellent = PencatatanScoreExcellent;
        respo.PencatatanPointExcellent = PencatatanPointExcellent;
        // poor live chat
        respo.AnalisScorePoor = AnalisScorePoor;
        respo.AnalisPointPoor = AnalisPointPoor;
        respo.SolusiScorePoor = SolusiScorePoor;
        respo.SolusiPointPoor = SolusiPointPoor;
        respo.MaintenanceScorePoor = MaintenanceScorePoor;
        respo.MaintenancePointPoor = MaintenancePointPoor;
        respo.MaintenanceScoreMeetExpect = MaintenanceScoreMeetExpect;
        respo.MaintenancePointMeetExpect = MaintenancePointMeetExpect;
        return respo;
    }
    
    public class responseFetchScoring {
        //pass sosmed + email
        @AuraEnabled public Decimal responseScorePass;
        @AuraEnabled public Decimal responsePointPass;
        @AuraEnabled public Decimal InfoAkurScorePass;
        @AuraEnabled public Decimal InfoAkurPointPass;
        @AuraEnabled public Decimal CourtesyScorePass;
        @AuraEnabled public Decimal CourtesyPointPass;
        //fail sosmed + email
        @AuraEnabled public Decimal responseScoreFail;
        @AuraEnabled public Decimal responsePointFail;
        @AuraEnabled public Decimal InfoAkurScoreFail;
        @AuraEnabled public Decimal InfoAkurPointFail;
        @AuraEnabled public Decimal CourtesyScoreFail;
        @AuraEnabled public Decimal CourtesyPointFail;
        //pass live chat
        @AuraEnabled public Decimal SalpemScorePass;
        @AuraEnabled public Decimal SalpemPointPass;
        @AuraEnabled public Decimal FirstRespScorePass;
        @AuraEnabled public Decimal FirstRespPointPass ;
        @AuraEnabled public Decimal SapaScorePass;
        @AuraEnabled public Decimal SapaPointPass;
        @AuraEnabled public Decimal PengBahasaScorePass;
        @AuraEnabled public Decimal PengBahasaPointPass;
        @AuraEnabled public Decimal PengJargonScorePass;
        @AuraEnabled public Decimal PengJargonPointPass;
        @AuraEnabled public Decimal EmpatiScorePass;
        @AuraEnabled public Decimal EmpatiPointPass;
        @AuraEnabled public Decimal GaliScorePass;
        @AuraEnabled public Decimal GaliPointPass ;
        @AuraEnabled public Decimal PenutupScorePass;
        @AuraEnabled public Decimal PenutupPointPass;
        // fail live chat
        @AuraEnabled public Decimal SalpemScoreFail;
        @AuraEnabled public Decimal SalpemPointFail;
        @AuraEnabled public Decimal FirstRespScoreFail;
        @AuraEnabled public Decimal FirstRespPointFail;
        @AuraEnabled public Decimal SapaScoreFail;
        @AuraEnabled public Decimal SapaPointFail;
        @AuraEnabled public Decimal PengBahasaScoreFail;
        @AuraEnabled public Decimal PengBahasaPointFail;
        @AuraEnabled public Decimal PengJargonScoreFail;
        @AuraEnabled public Decimal PengJargonPointFail;
        @AuraEnabled public Decimal EmpatiScoreFail;
        @AuraEnabled public Decimal EmpatiPointFail;
        @AuraEnabled public Decimal GaliScoreFail;
        @AuraEnabled public Decimal GaliPointFail;
        @AuraEnabled public Decimal SolusiScoreFail;
        @AuraEnabled public Decimal SolusiPointFail;
        @AuraEnabled public Decimal MenjawabScoreFail;
        @AuraEnabled public Decimal MenjawabPointFail;
        @AuraEnabled public Decimal PencatatanScoreFail;
        @AuraEnabled public Decimal PencatatanPointFail;
        @AuraEnabled public Decimal MaintenanceScoreFail;
        @AuraEnabled public Decimal MaintenancePointFail;
        @AuraEnabled public Decimal PenutupScoreFail;
        @AuraEnabled public Decimal PenutupPointFail;
        // N/A live chat
        @AuraEnabled public Decimal SalpemScoreNA ;
        @AuraEnabled public Decimal SalpemPointNA ;
        @AuraEnabled public Decimal FirstRespScoreNA ;
        @AuraEnabled public Decimal FirstRespPointNA;
        @AuraEnabled public Decimal SapaScoreNA;
        @AuraEnabled public Decimal SapaPointNA;
        @AuraEnabled public Decimal PengBahasaScoreNA;
        @AuraEnabled public Decimal PengBahasaPointNA;
        @AuraEnabled public Decimal PengJargonScoreNA;
        @AuraEnabled public Decimal PengJargonPointNA;
        @AuraEnabled public Decimal EmpatiScoreNA;
        @AuraEnabled public Decimal EmpatiPointNA;
        @AuraEnabled public Decimal AnalisScoreNA;
        @AuraEnabled public Decimal AnalisPointNA;
        @AuraEnabled public Decimal GaliScoreNA;
        @AuraEnabled public Decimal GaliPointNA;
        @AuraEnabled public Decimal SolusiScoreNA;
        @AuraEnabled public Decimal SolusiPointNA;
        @AuraEnabled public Decimal MenjawabScoreNA;
        @AuraEnabled public Decimal MenjawabPointNA;
        @AuraEnabled public Decimal PencatatanScoreNA;
        @AuraEnabled public Decimal PencatatanPointNA;
        @AuraEnabled public Decimal MaintenanceScoreNA;
        @AuraEnabled public Decimal MaintenancePointNA;
        @AuraEnabled public Decimal PenutupScoreNA;
        @AuraEnabled public Decimal PenutupPointNA;
        // excellent live chat
        @AuraEnabled public Decimal AnalisScoreExcellent;
        @AuraEnabled public Decimal AnalisPointExcellent;
        @AuraEnabled public Decimal SolusiScoreExcellent;
        @AuraEnabled public Decimal SolusiPointExcellent;
        @AuraEnabled public Decimal MenjawabScoreExcellent;
        @AuraEnabled public Decimal MenjawabPointExcellent;
        @AuraEnabled public Decimal PencatatanScoreExcellent;
        @AuraEnabled public Decimal PencatatanPointExcellent;
        // poor live chat
        @AuraEnabled public Decimal AnalisScorePoor;
        @AuraEnabled public Decimal AnalisPointPoor;
        @AuraEnabled public Decimal SolusiScorePoor;
        @AuraEnabled public Decimal SolusiPointPoor;
        @AuraEnabled public Decimal MaintenanceScorePoor;
        @AuraEnabled public Decimal MaintenancePointPoor;
        // meet expect
        @AuraEnabled public Decimal MaintenanceScoreMeetExpect;
        @AuraEnabled public Decimal MaintenancePointMeetExpect;
    }

    @AuraEnabled
    public static Assessment__c getAssessmentData(Id assessmentId, String edit){
        System.debug('recId editallcase->'+assessmentId);
        System.debug('edit editallcase->'+edit);
        Assessment__c Assesst = new Assessment__c();
        if(edit != null) {
            Assesst = [SELECT Id, Case_Number__r.CaseNumber, Respon_Time_Evaluation__c, Name, Subject_Custom__c, Respon_Time_Point__c, Respon_Time_Score__c, Information_Accuracy_Point__c, Information_Accuracy_Score__c,
                                    Courtesy_Point__c, Courtesy_Score__c, Ketidaksesuaian__c, Alasan__c, Information_Accuracy_Evaluation__c, Courtesy__c,
                                    Remarks_Pujian__c, Score_and_Remarks_Pujian__c, Total_Score__c,
                                    /*Separator Score*/
                                    Salam_Pembuka_Score__c,First_Response_Next_Response_Score__c,Sapa_Nama_Pemilik_Akun_Score__c,Penggunaan_Bahasa_Singkatan_Score__c,Penggunaan_Jargon_Score__c,
                                    Empati_Score__c,Gali_Info_Score__c,Analisa_Permasalahan_Score__c,Memberikan_Solusi_Score__c,Menjawab_Semua_Pertanyaan_Score__c,Lakukan_Pencatatan_Score__c,
                                    Maintenance_Chat_Score__c,Salam_Penutup_Score__c/*Separator Point*/,
                                    Salam_Pembuka_Point__c,First_Response_Next_Response__c,Sapa_Nama_Pemilik_Akun_Point__c,Penggunaan_Bahasa_Singkatan_Point__c,Penggunaan_Jargon_Point__c,Empati_Point__c,
                                    Gali_Info_Point__c,Analisa_Permasalahan_Point__c,Memberikan_Solusi_Point__c,Menjawab_Semua_Pertanyaan_Point__c,Lakukan_Pencatatan_Point__c,Maintenance_Chat_Point__c,
                                    Salam_Penutup_Point__c/*Separator Evaluation*/,
                                    Salam_Pembuka_Evaluation__c,First_Response_Next_Response_Evaluation__c,Sapa_Nama_Pemilik_Akun_Evaluation__c,Penggunaan_Bahasa_Singkatan_Evaluation__c,Penggunaan_Jargon__c,
                                    Empati_Evaluation__c,Gali_Info_Evaluation__c,Analisa_Permasalahan_Evaluation__c,Memberikan_Solusi_Evaluation__c,Menjawab_Semua_Pertanyaan_Evaluation__c,Lakukan_Pencatatan_Evaluation__c,
                                    Maintenance_Chat_Evaluation__c,Salam_Penutup_Evaluation__c
                                    FROM Assessment__c WHERE id =: assessmentId and Input_Status__c = 'Updated' limit 1];
        }else {
            AssessmentPeriod__c AssesPeriod = [SELECT Id ,Agent_Name__c, RecordTypeId, RecordType.Name
                                            FROM AssessmentPeriod__c
                                            WHERE id= :assessmentId ];
            String AgentName = AssesPeriod.Agent_Name__c;
            String recType = AssesPeriod.RecordType.Name;
            System.debug('recTypeId '+AssesPeriod.RecordTypeId);
            System.debug('recType '+recType);
            Id recTypeAssessment = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get(recType).getRecordTypeId();
            System.debug('ID recTypeAssessment '+recTypeAssessment);
            Assesst = [SELECT Id, Case_Number__r.CaseNumber, Subject_Custom__c, Agent_Name__c
                    FROM Assessment__c
                    WHERE Agent_Name__c= :AgentName And Input_Status__c = 'New' AND 
                    Assessment_Period__c = :assessmentId AND RecordTypeId = :recTypeAssessment limit 1];
        }
        System.debug('AgentName ' +Assesst);
        if(Assesst == null) {
            Assesst = null;
        }
        return Assesst;
    }


    @AuraEnabled
    public static Object SaveAssest(Assessment__c Assest, id recId){
        System.debug('Assest '+Assest);
        System.debug('recId save '+recId);
        List<Assessment__c> AssList = new List<Assessment__c>();
        List<AssessmentPeriod__c> AssesPeriod = [SELECT Id ,Agent_Name__c, RecordType.Name FROM AssessmentPeriod__c WHERE id= :recId ];
        if(AssesPeriod.size()>0) {
            String AgentName = AssesPeriod[0].Agent_Name__c;
            String recTypeName = AssesPeriod[0].RecordType.Name;
            System.debug(AgentName);
            System.debug(recTypeName);
            AssList = [SELECT Id, Respon_Time_Point__c, Respon_Time_Score__c, Information_Accuracy_Point__c, Information_Accuracy_Score__c, Courtesy_Point__c,
                                            Courtesy_Score__c, Subject_Custom__c, Remarks_Pujian__c, Total_Score__c, Ketidaksesuaian__c, Alasan__c, Score_and_Remarks_Pujian__c, Input_Status__c,
                                            /*Separator Score*/
                                            Salam_Pembuka_Score__c,First_Response_Next_Response_Score__c,Sapa_Nama_Pemilik_Akun_Score__c,Penggunaan_Bahasa_Singkatan_Score__c,Penggunaan_Jargon_Score__c,
                                            Empati_Score__c,Gali_Info_Score__c,Analisa_Permasalahan_Score__c,Memberikan_Solusi_Score__c,Menjawab_Semua_Pertanyaan_Score__c,Lakukan_Pencatatan_Score__c,
                                            Maintenance_Chat_Score__c,Salam_Penutup_Score__c/*Separator Point*/,
                                            Salam_Pembuka_Point__c,First_Response_Next_Response__c,Sapa_Nama_Pemilik_Akun_Point__c,Penggunaan_Bahasa_Singkatan_Point__c,Penggunaan_Jargon_Point__c,Empati_Point__c,
                                            Gali_Info_Point__c,Analisa_Permasalahan_Point__c,Memberikan_Solusi_Point__c,Menjawab_Semua_Pertanyaan_Point__c,Lakukan_Pencatatan_Point__c,Maintenance_Chat_Point__c,
                                            Salam_Penutup_Point__c/*Separator Evaluation*/,
                                            Salam_Pembuka_Evaluation__c,First_Response_Next_Response_Evaluation__c,Sapa_Nama_Pemilik_Akun_Evaluation__c,Penggunaan_Bahasa_Singkatan_Evaluation__c,Penggunaan_Jargon__c,
                                            Empati_Evaluation__c,Gali_Info_Evaluation__c,Analisa_Permasalahan_Evaluation__c,Memberikan_Solusi_Evaluation__c,Menjawab_Semua_Pertanyaan_Evaluation__c,Lakukan_Pencatatan_Evaluation__c,
                                            Maintenance_Chat_Evaluation__c,Salam_Penutup_Evaluation__c
                                            FROM Assessment__c WHERE Agent_Name__c= :AgentName AND Input_Status__c = 'New' AND Id = :Assest.Id
                       						limit 1];
    
            if(recTypeName == 'Social Media + Email') {
                    for(Assessment__c asmList : AssList) {
                    asmList.Subject_Custom__c = Assest.Subject_Custom__c;
                    asmList.Respon_Time_Evaluation__c = Assest.Respon_Time_Evaluation__c;
                    asmList.Respon_Time_Point__c = Assest.Respon_Time_Point__c;
                    asmList.Respon_Time_Score__c = Assest.Respon_Time_Score__c;
                    asmList.Information_Accuracy_Evaluation__c = Assest.Information_Accuracy_Evaluation__c;
                    asmList.Information_Accuracy_Point__c = Assest.Information_Accuracy_Point__c;
                    asmList.Information_Accuracy_Score__c = Assest.Information_Accuracy_Score__c;
                    asmList.Courtesy__c = Assest.Courtesy__c;
                    asmList.Courtesy_Point__c = Assest.Courtesy_Point__c;
                    asmList.Courtesy_Score__c = Assest.Courtesy_Score__c;
                    asmList.Total_Score__c = Assest.Total_Score__c;
                    asmList.Remarks_Pujian__c = Assest.Remarks_Pujian__c;
                    asmList.Ketidaksesuaian__c = Assest.Ketidaksesuaian__c;
                    asmList.Alasan__c = Assest.Alasan__c;
                    asmList.Score_and_Remarks_Pujian__c = Assest.Score_and_Remarks_Pujian__c;
                    asmList.Input_Status__c = 'Updated';
                }
            }else {
                for(Assessment__c asmList : AssList) {
                    asmList.Subject_Custom__c = Assest.Subject_Custom__c;
                    //Score
                    asmList.Salam_Pembuka_Score__c = Assest.Salam_Pembuka_Score__c;
                    asmList.First_Response_Next_Response_Score__c = Assest.First_Response_Next_Response_Score__c;
                    asmList.Sapa_Nama_Pemilik_Akun_Score__c = Assest.Sapa_Nama_Pemilik_Akun_Score__c;
                    asmList.Penggunaan_Bahasa_Singkatan_Score__c = Assest.Penggunaan_Bahasa_Singkatan_Score__c;
                    asmList.Penggunaan_Jargon_Score__c = Assest.Penggunaan_Jargon_Score__c;
                    asmList.Empati_Score__c = Assest.Empati_Score__c;
                    asmList.Gali_Info_Score__c = Assest.Gali_Info_Score__c;
                    asmList.Analisa_Permasalahan_Score__c = Assest.Analisa_Permasalahan_Score__c;
                    asmList.Memberikan_Solusi_Score__c = Assest.Memberikan_Solusi_Score__c;
                    asmList.Menjawab_Semua_Pertanyaan_Score__c = Assest.Menjawab_Semua_Pertanyaan_Score__c;
                    asmList.Lakukan_Pencatatan_Score__c = Assest.Lakukan_Pencatatan_Score__c;
                    asmList.Maintenance_Chat_Score__c = Assest.Maintenance_Chat_Score__c;
                    asmList.Salam_Penutup_Score__c = Assest.Salam_Penutup_Score__c;
                    //Point
                    asmList.Salam_Pembuka_Point__c = Assest.Salam_Pembuka_Point__c;
                    asmList.First_Response_Next_Response__c = Assest.First_Response_Next_Response__c;
                    asmList.Sapa_Nama_Pemilik_Akun_Point__c = Assest.Sapa_Nama_Pemilik_Akun_Point__c;
                    asmList.Penggunaan_Bahasa_Singkatan_Point__c = Assest.Penggunaan_Bahasa_Singkatan_Point__c;
                    asmList.Penggunaan_Jargon_Point__c = Assest.Penggunaan_Jargon_Point__c;
                    asmList.Empati_Point__c = Assest.Empati_Point__c;
                    asmList.Gali_Info_Point__c = Assest.Gali_Info_Point__c;
                    asmList.Analisa_Permasalahan_Point__c = Assest.Analisa_Permasalahan_Point__c;
                    asmList.Memberikan_Solusi_Point__c = Assest.Memberikan_Solusi_Point__c;
                    asmList.Menjawab_Semua_Pertanyaan_Point__c = Assest.Menjawab_Semua_Pertanyaan_Point__c;
                    asmList.Lakukan_Pencatatan_Point__c = Assest.Lakukan_Pencatatan_Point__c;
                    asmList.Maintenance_Chat_Point__c = Assest.Maintenance_Chat_Point__c;
                    asmList.Salam_Penutup_Point__c = Assest.Salam_Penutup_Point__c;
                    //Evaluation
                    asmList.Salam_Pembuka_Evaluation__c = Assest.Salam_Pembuka_Evaluation__c;
                    asmList.First_Response_Next_Response_Evaluation__c = Assest.First_Response_Next_Response_Evaluation__c;
                    asmList.Sapa_Nama_Pemilik_Akun_Evaluation__c = Assest.Sapa_Nama_Pemilik_Akun_Evaluation__c;
                    asmList.Penggunaan_Bahasa_Singkatan_Evaluation__c = Assest.Penggunaan_Bahasa_Singkatan_Evaluation__c;
                    asmList.Penggunaan_Jargon__c = Assest.Penggunaan_Jargon__c;
                    asmList.Empati_Evaluation__c = Assest.Empati_Evaluation__c;
                    asmList.Gali_Info_Evaluation__c = Assest.Gali_Info_Evaluation__c;
                    asmList.Analisa_Permasalahan_Evaluation__c = Assest.Analisa_Permasalahan_Evaluation__c;
                    asmList.Memberikan_Solusi_Evaluation__c = Assest.Memberikan_Solusi_Evaluation__c;
                    asmList.Menjawab_Semua_Pertanyaan_Evaluation__c = Assest.Menjawab_Semua_Pertanyaan_Evaluation__c;
                    asmList.Lakukan_Pencatatan_Evaluation__c = Assest.Lakukan_Pencatatan_Evaluation__c;
                    asmList.Maintenance_Chat_Evaluation__c = Assest.Maintenance_Chat_Evaluation__c;
                    asmList.Salam_Penutup_Evaluation__c = Assest.Salam_Penutup_Evaluation__c;
                    //Total Score
                    asmList.Total_Score__c = Assest.Total_Score__c;
                    asmList.Remarks_Pujian__c = Assest.Remarks_Pujian__c;
                    asmList.Ketidaksesuaian__c = Assest.Ketidaksesuaian__c;
                    asmList.Alasan__c = Assest.Alasan__c;
                    asmList.Score_and_Remarks_Pujian__c = Assest.Score_and_Remarks_Pujian__c;
                    asmList.Input_Status__c = 'Updated';
                }
            }
        }
        else {
            AssList = [SELECT Id, Respon_Time_Point__c, Respon_Time_Score__c, Information_Accuracy_Point__c, Information_Accuracy_Score__c, Courtesy_Point__c,
                                            Courtesy_Score__c, Subject_Custom__c, Remarks_Pujian__c, Total_Score__c, Ketidaksesuaian__c, Alasan__c, Score_and_Remarks_Pujian__c, Input_Status__c,
                                            /*Separator Score*/
                                            Salam_Pembuka_Score__c,First_Response_Next_Response_Score__c,Sapa_Nama_Pemilik_Akun_Score__c,Penggunaan_Bahasa_Singkatan_Score__c,Penggunaan_Jargon_Score__c,
                                            Empati_Score__c,Gali_Info_Score__c,Analisa_Permasalahan_Score__c,Memberikan_Solusi_Score__c,Menjawab_Semua_Pertanyaan_Score__c,Lakukan_Pencatatan_Score__c,
                                            Maintenance_Chat_Score__c,Salam_Penutup_Score__c/*Separator Point*/,
                                            Salam_Pembuka_Point__c,First_Response_Next_Response__c,Sapa_Nama_Pemilik_Akun_Point__c,Penggunaan_Bahasa_Singkatan_Point__c,Penggunaan_Jargon_Point__c,Empati_Point__c,
                                            Gali_Info_Point__c,Analisa_Permasalahan_Point__c,Memberikan_Solusi_Point__c,Menjawab_Semua_Pertanyaan_Point__c,Lakukan_Pencatatan_Point__c,Maintenance_Chat_Point__c,
                                            Salam_Penutup_Point__c/*Separator Evaluation*/,
                                            Salam_Pembuka_Evaluation__c,First_Response_Next_Response_Evaluation__c,Sapa_Nama_Pemilik_Akun_Evaluation__c,Penggunaan_Bahasa_Singkatan_Evaluation__c,Penggunaan_Jargon__c,
                                            Empati_Evaluation__c,Gali_Info_Evaluation__c,Analisa_Permasalahan_Evaluation__c,Memberikan_Solusi_Evaluation__c,Menjawab_Semua_Pertanyaan_Evaluation__c,Lakukan_Pencatatan_Evaluation__c,
                                            Maintenance_Chat_Evaluation__c,Salam_Penutup_Evaluation__c, RecordTypeId, RecordType.Name
                                            FROM Assessment__c WHERE id = :recId AND Input_Status__c = 'Updated' limit 1];
            if(AssList[0].RecordType.Name == 'Social Media + Email') {
                    for(Assessment__c asmList : AssList) {
                    asmList.Subject_Custom__c = Assest.Subject_Custom__c;
                    asmList.Respon_Time_Evaluation__c = Assest.Respon_Time_Evaluation__c;
                    asmList.Respon_Time_Point__c = Assest.Respon_Time_Point__c;
                    asmList.Respon_Time_Score__c = Assest.Respon_Time_Score__c;
                    asmList.Information_Accuracy_Evaluation__c = Assest.Information_Accuracy_Evaluation__c;
                    asmList.Information_Accuracy_Point__c = Assest.Information_Accuracy_Point__c;
                    asmList.Information_Accuracy_Score__c = Assest.Information_Accuracy_Score__c;
                    asmList.Courtesy__c = Assest.Courtesy__c;
                    asmList.Courtesy_Point__c = Assest.Courtesy_Point__c;
                    asmList.Courtesy_Score__c = Assest.Courtesy_Score__c;
                    asmList.Total_Score__c = Assest.Total_Score__c;
                    asmList.Remarks_Pujian__c = Assest.Remarks_Pujian__c;
                    asmList.Ketidaksesuaian__c = Assest.Ketidaksesuaian__c;
                    asmList.Alasan__c = Assest.Alasan__c;
                    asmList.Score_and_Remarks_Pujian__c = Assest.Score_and_Remarks_Pujian__c;
                    asmList.Input_Status__c = 'Updated';
                }
            }else {
                for(Assessment__c asmList : AssList) {
                    asmList.Subject_Custom__c = Assest.Subject_Custom__c;
                    //Score
                    asmList.Salam_Pembuka_Score__c = Assest.Salam_Pembuka_Score__c;
                    asmList.First_Response_Next_Response_Score__c = Assest.First_Response_Next_Response_Score__c;
                    asmList.Sapa_Nama_Pemilik_Akun_Score__c = Assest.Sapa_Nama_Pemilik_Akun_Score__c;
                    asmList.Penggunaan_Bahasa_Singkatan_Score__c = Assest.Penggunaan_Bahasa_Singkatan_Score__c;
                    asmList.Penggunaan_Jargon_Score__c = Assest.Penggunaan_Jargon_Score__c;
                    asmList.Empati_Score__c = Assest.Empati_Score__c;
                    asmList.Gali_Info_Score__c = Assest.Gali_Info_Score__c;
                    asmList.Analisa_Permasalahan_Score__c = Assest.Analisa_Permasalahan_Score__c;
                    asmList.Memberikan_Solusi_Score__c = Assest.Memberikan_Solusi_Score__c;
                    asmList.Menjawab_Semua_Pertanyaan_Score__c = Assest.Menjawab_Semua_Pertanyaan_Score__c;
                    asmList.Lakukan_Pencatatan_Score__c = Assest.Lakukan_Pencatatan_Score__c;
                    asmList.Maintenance_Chat_Score__c = Assest.Maintenance_Chat_Score__c;
                    asmList.Salam_Penutup_Score__c = Assest.Salam_Penutup_Score__c;
                    //Point
                    asmList.Salam_Pembuka_Point__c = Assest.Salam_Pembuka_Point__c;
                    asmList.First_Response_Next_Response__c = Assest.First_Response_Next_Response__c;
                    asmList.Sapa_Nama_Pemilik_Akun_Point__c = Assest.Sapa_Nama_Pemilik_Akun_Point__c;
                    asmList.Penggunaan_Bahasa_Singkatan_Point__c = Assest.Penggunaan_Bahasa_Singkatan_Point__c;
                    asmList.Penggunaan_Jargon_Point__c = Assest.Penggunaan_Jargon_Point__c;
                    asmList.Empati_Point__c = Assest.Empati_Point__c;
                    asmList.Gali_Info_Point__c = Assest.Gali_Info_Point__c;
                    asmList.Analisa_Permasalahan_Point__c = Assest.Analisa_Permasalahan_Point__c;
                    asmList.Memberikan_Solusi_Point__c = Assest.Memberikan_Solusi_Point__c;
                    asmList.Menjawab_Semua_Pertanyaan_Point__c = Assest.Menjawab_Semua_Pertanyaan_Point__c;
                    asmList.Lakukan_Pencatatan_Point__c = Assest.Lakukan_Pencatatan_Point__c;
                    asmList.Maintenance_Chat_Point__c = Assest.Maintenance_Chat_Point__c;
                    asmList.Salam_Penutup_Point__c = Assest.Salam_Penutup_Point__c;
                    //Evaluation
                    asmList.Salam_Pembuka_Evaluation__c = Assest.Salam_Pembuka_Evaluation__c;
                    asmList.First_Response_Next_Response_Evaluation__c = Assest.First_Response_Next_Response_Evaluation__c;
                    asmList.Sapa_Nama_Pemilik_Akun_Evaluation__c = Assest.Sapa_Nama_Pemilik_Akun_Evaluation__c;
                    asmList.Penggunaan_Bahasa_Singkatan_Evaluation__c = Assest.Penggunaan_Bahasa_Singkatan_Evaluation__c;
                    asmList.Penggunaan_Jargon__c = Assest.Penggunaan_Jargon__c;
                    asmList.Empati_Evaluation__c = Assest.Empati_Evaluation__c;
                    asmList.Gali_Info_Evaluation__c = Assest.Gali_Info_Evaluation__c;
                    asmList.Analisa_Permasalahan_Evaluation__c = Assest.Analisa_Permasalahan_Evaluation__c;
                    asmList.Memberikan_Solusi_Evaluation__c = Assest.Memberikan_Solusi_Evaluation__c;
                    asmList.Menjawab_Semua_Pertanyaan_Evaluation__c = Assest.Menjawab_Semua_Pertanyaan_Evaluation__c;
                    asmList.Lakukan_Pencatatan_Evaluation__c = Assest.Lakukan_Pencatatan_Evaluation__c;
                    asmList.Maintenance_Chat_Evaluation__c = Assest.Maintenance_Chat_Evaluation__c;
                    asmList.Salam_Penutup_Evaluation__c = Assest.Salam_Penutup_Evaluation__c;
                    //Total Score
                    asmList.Total_Score__c = Assest.Total_Score__c;
                    asmList.Remarks_Pujian__c = Assest.Remarks_Pujian__c;
                    asmList.Ketidaksesuaian__c = Assest.Ketidaksesuaian__c;
                    asmList.Alasan__c = Assest.Alasan__c;
                    asmList.Score_and_Remarks_Pujian__c = Assest.Score_and_Remarks_Pujian__c;
                    asmList.Input_Status__c = 'Updated';
                }
            }
        }
        System.debug('AssList '+AssList);
        update AssList;
        return AssList;
    }
}