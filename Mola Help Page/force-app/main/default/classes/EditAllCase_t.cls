@isTest
public class EditAllCase_t {
    @isTest static void Score(){
        RecordType rtassper = [
            SELECT Id
            FROM RecordType
            WHERE Name = 'Live Chat' AND SobjectType = 'AssessmentPeriod__c'
        ];
        
        RecordType rtassment = [
            SELECT Id
            FROM RecordType
            WHERE Name = 'Live Chat' AND SobjectType = 'Assessment__c'
        ];
        
        RecordType rtassmentSoc = [
            SELECT Id
            FROM RecordType
            WHERE Name = 'Social Media + Email' AND SobjectType = 'Assessment__c'
        ];
        
        //fail
        Scoring__c score = new Scoring__c();
        score.Evaluation__c = 'Fail';
        score.Score__c = 30;
        score.Category__c = 'Respon Time';
        score.Name = 'abc';
        insert score;
        
        Scoring__c score2 = new Scoring__c();
        score2.Evaluation__c = 'Fail';
        score2.Score__c = 30;
        score2.Category__c = 'Information Accuracy';
        score2.Name = 'abcd';
        insert score2;
        
        Scoring__c score3 = new Scoring__c();
        score3.Evaluation__c = 'Fail';
        score3.Score__c = 30;
        score3.Category__c = 'Courtesy';
        score3.Name = 'abcd';
        insert score3;
        
        Scoring__c score4 = new Scoring__c();
        score4.Evaluation__c = 'Fail';
        score4.Score__c = 30;
        score4.Category__c = 'Salam Pembuka';
        score4.Name = 'abcd';
        insert score4;
        
        Scoring__c score5 = new Scoring__c();
        score5.Evaluation__c = 'Fail';
        score5.Score__c = 30;
        score5.Category__c = 'First Response & Next Response';
        score5.Name = 'abcd';
        insert score5;
        //
        Scoring__c score6 = new Scoring__c();
        score6.Evaluation__c = 'Fail';
        score6.Score__c = 30;
        score6.Category__c = 'Sapa Nama Pemilik Akun';
        score6.Name = 'abcd';
        insert score6;
        
        Scoring__c score7 = new Scoring__c();
        score7.Evaluation__c = 'Fail';
        score7.Score__c = 30;
        score7.Category__c = 'Penggunaan Bahasa dan Singkatan Umum';
        score7.Name = 'abcd';
        insert score7;
        
        Scoring__c score8 = new Scoring__c();
        score8.Evaluation__c = 'Fail';
        score8.Score__c = 30;
        score8.Category__c = 'Penggunaan Jargon';
        score8.Name = 'abcd';
        insert score8;
        
        Scoring__c score9 = new Scoring__c();
        score9.Evaluation__c = 'Fail';
        score9.Score__c = 30;
        score9.Category__c = 'Empati';
        score9.Name = 'abcd';
        insert score9;
        
        Scoring__c score10 = new Scoring__c();
        score10.Evaluation__c = 'Fail';
        score10.Score__c = 30;
        score10.Category__c = 'Gali Info';
        score10.Name = 'abcd';
        insert score10;
        
        Scoring__c score11 = new Scoring__c();
        score11.Evaluation__c = 'Fail';
        score11.Score__c = 30;
        score11.Category__c = 'Memberikan Solusi';
        score11.Name = 'abcd';
        insert score11;
        
        Scoring__c score12 = new Scoring__c();
        score12.Evaluation__c = 'Fail';
        score12.Score__c = 30;
        score12.Category__c = 'Menjawab Semua Pertanyaan User';
        score12.Name = 'abcd';
        insert score12;
        
        Scoring__c score13 = new Scoring__c();
        score13.Evaluation__c = 'Fail';
        score13.Score__c = 30;
        score13.Category__c = 'Lakukan Pencatatan';
        score13.Name = 'abcd';
        insert score13;
        
        Scoring__c score14 = new Scoring__c();
        score14.Evaluation__c = 'Fail';
        score14.Score__c = 30;
        score14.Category__c = 'Maintenance Chat';
        score14.Name = 'abcd';
        insert score14;
        
        Scoring__c score15 = new Scoring__c();
        score15.Evaluation__c = 'Fail';
        score15.Score__c = 30;
        score15.Category__c = 'Salam Penutup';
        score15.Name = 'abcd';
        insert score15;
        
        //pass
        Scoring__c scorea = new Scoring__c();
        scorea.Evaluation__c = 'Pass';
        scorea.Score__c = 30;
        scorea.Category__c = 'Respon Time';
        scorea.Name = 'abcde';
        insert scorea;
        
        Scoring__c scoreb = new Scoring__c();
        scoreb.Evaluation__c = 'Pass';
        scoreb.Score__c = 30;
        scoreb.Category__c = 'Information Accuracy';
        scoreb.Name = 'abcd';
        insert scoreb;
        
        Scoring__c scorec = new Scoring__c();
        scorec.Evaluation__c = 'Pass';
        scorec.Score__c = 30;
        scorec.Category__c = 'Courtesy';
        scorec.Name = 'abcd';
        insert scorec;
        
        Scoring__c scored = new Scoring__c();
        scored.Evaluation__c = 'Pass';
        scored.Score__c = 30;
        scored.Category__c = 'Salam Pembuka';
        scored.Name = 'abcd';
        insert scored;
        
        Scoring__c scoree = new Scoring__c();
        scoree.Evaluation__c = 'Pass';
        scoree.Score__c = 30;
        scoree.Category__c = 'First Response & Next Response';
        scoree.Name = 'abcd';
        insert scoree;
        //
        Scoring__c scoref = new Scoring__c();
        scoref.Evaluation__c = 'Pass';
        scoref.Score__c = 30;
        scoref.Category__c = 'Sapa Nama Pemilik Akun';
        scoref.Name = 'abcd';
        insert scoref;
        
        Scoring__c scoreg = new Scoring__c();
        scoreg.Evaluation__c = 'Pass';
        scoreg.Score__c = 30;
        scoreg.Category__c = 'Penggunaan Bahasa dan Singkatan Umum';
        scoreg.Name = 'abcd';
        insert scoreg;
        
        Scoring__c scoreh = new Scoring__c();
        scoreh.Evaluation__c = 'Pass';
        scoreh.Score__c = 30;
        scoreh.Category__c = 'Penggunaan Jargon';
        scoreh.Name = 'abcd';
        insert scoreh;
        
        Scoring__c scorei = new Scoring__c();
        scorei.Evaluation__c = 'Pass';
        scorei.Score__c = 30;
        scorei.Category__c = 'Empati';
        scorei.Name = 'abcd';
        insert scorei;
        
        Scoring__c scorej = new Scoring__c();
        scorej.Evaluation__c = 'Pass';
        scorej.Score__c = 30;
        scorej.Category__c = 'Gali Info';
        scorej.Name = 'abcd';
        insert scorej;
        
        Scoring__c scoreo = new Scoring__c();
        scoreo.Evaluation__c = 'Pass';
        scoreo.Score__c = 30;
        scoreo.Category__c = 'Salam Penutup';
        scoreo.Name = 'abcd';
        insert scoreo;
        //N/A
        
        Scoring__c score16 = new Scoring__c();
        score16.Evaluation__c = 'N/A';
        score16.Score__c = 30;
        score16.Category__c = 'Salam Pembuka';
        score16.Name = 'abcd';
        insert score16;
        
        Scoring__c score17 = new Scoring__c();
        score17.Evaluation__c = 'N/A';
        score17.Score__c = 30;
        score17.Category__c = 'First Response & Next Response';
        score17.Name = 'abcd';
        insert score17;
        //
        Scoring__c score18 = new Scoring__c();
        score18.Evaluation__c = 'N/A';
        score18.Score__c = 30;
        score18.Category__c = 'Sapa Nama Pemilik Akun';
        score18.Name = 'abcd';
        insert score18;
        
        Scoring__c score19 = new Scoring__c();
        score19.Evaluation__c = 'N/A';
        score19.Score__c = 30;
        score19.Category__c = 'Penggunaan Bahasa dan Singkatan Umum';
        score19.Name = 'abcd';
        insert score19;
        
        Scoring__c score20 = new Scoring__c();
        score20.Evaluation__c = 'N/A';
        score20.Score__c = 30;
        score20.Category__c = 'Penggunaan Jargon';
        score20.Name = 'abcd';
        insert score20;
        
        Scoring__c score21 = new Scoring__c();
        score21.Evaluation__c = 'N/A';
        score21.Score__c = 30;
        score21.Category__c = 'Empati';
        score21.Name = 'abcd';
        insert score21;
        
        Scoring__c score22 = new Scoring__c();
        score22.Evaluation__c = 'N/A';
        score22.Score__c = 30;
        score22.Category__c = 'Gali Info';
        score22.Name = 'abcd';
        insert score22;
        
        Scoring__c score23 = new Scoring__c();
        score23.Evaluation__c = 'N/A';
        score23.Score__c = 30;
        score23.Category__c = 'Memberikan Solusi';
        score23.Name = 'abcd';
        insert score23;
        
        Scoring__c score24 = new Scoring__c();
        score24.Evaluation__c = 'N/A';
        score24.Score__c = 30;
        score24.Category__c = 'Menjawab Semua Pertanyaan User';
        score24.Name = 'abcd';
        insert score24;
        
        Scoring__c score25 = new Scoring__c();
        score25.Evaluation__c = 'N/A';
        score25.Score__c = 30;
        score25.Category__c = 'Lakukan Pencatatan';
        score25.Name = 'abcd';
        insert score25;
        
        Scoring__c score26 = new Scoring__c();
        score26.Evaluation__c = 'N/A';
        score26.Score__c = 30;
        score26.Category__c = 'Maintenance Chat';
        score26.Name = 'abcd';
        insert score26;
        
        Scoring__c score27 = new Scoring__c();
        score27.Evaluation__c = 'N/A';
        score27.Score__c = 30;
        score27.Category__c = 'Salam Penutup';
        score27.Name = 'abcd';
        insert score27;
        
        Scoring__c score28 = new Scoring__c();
        score28.Evaluation__c = 'N/A';
        score28.Score__c = 30;
        score28.Category__c = 'Analisa Permasalahan';
        score28.Name = 'abcd';
        insert score28;
        
        //excellent
        
        Scoring__c score29 = new Scoring__c();
        score29.Evaluation__c = 'Excellent';
        score29.Score__c = 30;
        score29.Category__c = 'Lakukan Pencatatan';
        score29.Name = 'abcd';
        insert score29;
        
        Scoring__c score30 = new Scoring__c();
        score30.Evaluation__c = 'Excellent';
        score30.Score__c = 30;
        score30.Category__c = 'Memberikan Solusi';
        score30.Name = 'abcd';
        insert score30;
        
        Scoring__c score31 = new Scoring__c();
        score31.Evaluation__c = 'Excellent';
        score31.Score__c = 30;
        score31.Category__c = 'Menjawab Semua Pertanyaan User';
        score31.Name = 'abcd';
        insert score31;
        
        Scoring__c score32 = new Scoring__c();
        score32.Evaluation__c = 'Excellent';
        score32.Score__c = 30;
        score32.Category__c = 'Analisa Permasalahan';
        score32.Name = 'abcd';
        insert score32;        
        
        //poor
        
        Scoring__c score33 = new Scoring__c();
        score33.Evaluation__c = 'Poor';
        score33.Score__c = 30;
        score33.Category__c = 'Analisa Permasalahan';
        score33.Name = 'abcd';
        insert score33;
        
        Scoring__c score34 = new Scoring__c();
        score34.Evaluation__c = 'Poor';
        score34.Score__c = 30;
        score34.Category__c = 'Memberikan Solusi';
        score34.Name = 'abcd';
        insert score34;
        
        Scoring__c score35 = new Scoring__c();
        score35.Evaluation__c = 'Poor';
        score35.Score__c = 30;
        score35.Category__c = 'Maintenance Chat';
        score35.Name = 'abcd';
        insert score35;
        
        //Meet Expectation
        
        Scoring__c score36 = new Scoring__c();
        score36.Evaluation__c = 'Meet Expectation';
        score36.Score__c = 30;
        score36.Category__c = 'Maintenance Chat';
        score36.Name = 'abcd';
        insert score36;       
        
        AssessmentPeriod__c assper = new AssessmentPeriod__c();
        assper.RecordTypeId = rtassper.id;
        assper.Name = 'test';
        assper.Start_Date__c = Date.newInstance(2019, 09, 01);
        assper.End_Date__c = Date.newInstance(2019, 09, 15);
        assper.Agent_Name__c = 'Ahmad Baihaqi';
        assper.Reviewer__c = 'Anissa';
        insert assper;
     
        Assessment__c asment = new Assessment__c();
        asment.RecordTypeId = rtassment.id;
        asment.Assessment_Period__c = assper.id;
        asment.Name = 'test2';
        asment.Agent_Name__c = 'Ahmad Baihaqi';
        asment.Subject_Custom__c = 'TEST';
        asment.Respon_Time_Evaluation__c = 'Pass';
        asment.Respon_Time_Point__c = 3;
        asment.Respon_Time_Score__c = 100;
        asment.Information_Accuracy_Evaluation__c = 'Pass';
        asment.Information_Accuracy_Point__c = 3;
        asment.Information_Accuracy_Score__c = 100;
        asment.Courtesy__c = 'Pass';
        asment.Courtesy_Point__c = 1;
        asment.Courtesy_Score__c =100;
        asment.Total_Score__c = 100;
        asment.Remarks_Pujian__c = 1;
        asment.Ketidaksesuaian__c = 'Test';
        asment.Alasan__c = 'test';
        asment.Score_and_Remarks_Pujian__c = 100;
        asment.Input_Status__c = 'Updated';
        insert asment;
        EditAllCaseController.Scoring();
        EditAllCaseController.SaveAssest(asment,assper.id);
        EditAllCaseController.getAssessmentData(asment.id, 'edited');
        
    }
    
    @isTest 
    public static void assessmentDataT(){
        RecordType rtassper2 = [SELECT Id, Name FROM RecordType WHERE Name = 'Social Media + Email' AND SobjectType = 'AssessmentPeriod__c'];
        
        AssessmentPeriod__c assper1 = new AssessmentPeriod__c();
        assper1.RecordTypeId = rtassper2.id;
        assper1.Name = 'test2';
        assper1.Start_Date__c = Date.newInstance(2019, 09, 01);
        assper1.End_Date__c = Date.newInstance(2019, 09, 15);
        assper1.Agent_Name__c = 'Ahmad Baihaqi';
        assper1.Reviewer__c = 'Anissa';
        insert assper1;
        
        
        System.debug('assper1 '+assper1);
        assper1 = [SELECT id,RecordtypeId, Agent_Name__c, RecordType.Name FROM AssessmentPeriod__c];
        System.debug('rectype '+assper1.RecordType.Name);
        
        Id recTypeAssessment = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get(assper1.RecordType.Name).getRecordTypeId();
        
        Assessment__c asment1 = new Assessment__c();
        asment1.RecordTypeId = recTypeAssessment;
        asment1.Assessment_Period__c = assper1.id;
        asment1.Agent_Name__c = assper1.Agent_Name__c;
        asment1.Name = 'test2';
        asment1.Subject_Custom__c = 'TEST';
        asment1.Respon_Time_Evaluation__c = 'Pass';
        asment1.Respon_Time_Point__c = 3;
        asment1.Respon_Time_Score__c = 100;
        asment1.Information_Accuracy_Evaluation__c = 'Pass';
        asment1.Information_Accuracy_Point__c = 3;
        asment1.Information_Accuracy_Score__c = 100;
        asment1.Courtesy__c = 'Pass';
        asment1.Courtesy_Point__c = 1;
        asment1.Courtesy_Score__c =100;
        asment1.Total_Score__c = 100;
        asment1.Remarks_Pujian__c = 1;
        asment1.Ketidaksesuaian__c = 'Test';
        asment1.Alasan__c = 'test';
        asment1.Score_and_Remarks_Pujian__c = 100;
        asment1.Input_Status__c = 'New';
        
        insert asment1;
        
        System.debug('asment1 '+asment1);
        System.debug('assper id: '+ assper1.id);
       // System.debug('asment1 id :');
        EditAllCaseController.getAssessmentData(asment1.Assessment_Period__c, null);
		EditAllCaseController.SaveAssest(asment1, assper1.Id);
    }
    
    @isTest 
    public static void assessmentData2(){
        RecordType rtassperLC = [SELECT Id, Name FROM RecordType WHERE Name = 'Live Chat' AND SobjectType = 'AssessmentPeriod__c'];
        
        AssessmentPeriod__c assper3 = new AssessmentPeriod__c();
        assper3.RecordTypeId = rtassperLC.id;
        assper3.Name = 'test2';
        assper3.Start_Date__c = Date.newInstance(2019, 09, 01);
        assper3.End_Date__c = Date.newInstance(2019, 09, 15);
        assper3.Agent_Name__c = 'Ahmad Baihaqi';
        assper3.Reviewer__c = 'Anissa';
        insert assper3;

        assper3 = [SELECT id,RecordtypeId, Agent_Name__c, RecordType.Name FROM AssessmentPeriod__c];
 
        Id recTypeAssessment = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get(assper3.RecordType.Name).getRecordTypeId();
        
        Assessment__c asment3 = new Assessment__c();
        asment3.RecordTypeId = recTypeAssessment;
        asment3.Assessment_Period__c = assper3.id;
        asment3.Agent_Name__c = assper3.Agent_Name__c;
        asment3.Name = 'test2';
        asment3.Subject_Custom__c = 'TEST';
        asment3.Respon_Time_Evaluation__c = 'Pass';
        asment3.Respon_Time_Point__c = 3;
        asment3.Respon_Time_Score__c = 100;
        asment3.Information_Accuracy_Evaluation__c = 'Pass';
        asment3.Information_Accuracy_Point__c = 3;
        asment3.Information_Accuracy_Score__c = 100;
        asment3.Courtesy__c = 'Pass';
        asment3.Courtesy_Point__c = 1;
        asment3.Courtesy_Score__c =100;
        asment3.Total_Score__c = 100;
        asment3.Remarks_Pujian__c = 1;
        asment3.Ketidaksesuaian__c = 'Test';
        asment3.Alasan__c = 'test';
        asment3.Score_and_Remarks_Pujian__c = 100;
        asment3.Input_Status__c = 'New';
        
        insert asment3;
        
        //System.debug('asment1 '+asment1);
        //System.debug('assper id: '+ assper1.id);
       // System.debug('asment1 id :');
        EditAllCaseController.getAssessmentData(asment3.Assessment_Period__c, null);
		EditAllCaseController.SaveAssest(asment3, assper3.Id);
    }
    
    /*@isTest 
    public static void assessmentData3(){
        
        RecordType rtassperSosMed = [SELECT Id, Name FROM RecordType WHERE Name = 'Social Media + Email' AND SobjectType = 'AssessmentPeriod__c'];
        system.debug('rtassperSosMed= '+rtassperSosMed);
        
        AssessmentPeriod__c assper4 = new AssessmentPeriod__c();
        

        
        
        
        Assessment__c asmentL = new Assessment__c();
        asmentL.RecordTypeId = assper4.id;
        system.debug('RectypeID: '+rtassperSosMed.Name);
        asmentL.Assessment_Period__c = assper4.id;
        asmentL.Name = 'test2';
        asmentL.Subject_Custom__c = 'TEST';
        asmentL.Respon_Time_Evaluation__c = 'Pass';
        asmentL.Respon_Time_Point__c = 3;
        asmentL.Respon_Time_Score__c = 100;
        asmentL.Information_Accuracy_Evaluation__c = 'Pass';
        asmentL.Information_Accuracy_Point__c = 3;
        asmentL.Information_Accuracy_Score__c = 100;
        asmentL.Courtesy__c = 'Pass';
        asmentL.Courtesy_Point__c = 1;
        asmentL.Courtesy_Score__c =100;
        asmentL.Total_Score__c = 100;
        asmentL.Remarks_Pujian__c = 1;
        asmentL.Ketidaksesuaian__c = 'Test';
        asmentL.Alasan__c = 'test';
        asmentL.Score_and_Remarks_Pujian__c = 100;
        asmentL.Input_Status__c = 'Updated';
        update asmentL;
        EditAllCaseController.SaveAssest(asmentL, assper4.Id);
    }*/
}