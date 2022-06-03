({
    btn_Save: function (component, event, helper) {
        var subfree = component.get('v.input.Subject_Custom__c');

        var navsp = component.find('salampem').get('v.value');
        var navresp = component.find('firstresp').get('v.value');
        var navsapa = component.find('sapaName').get('v.value');

        var navpengbas = component.find('pengbas').get('v.value');
        var navpengjar = component.find('pengjar').get('v.value');
        var navemp = component.find('empati').get('v.value');

        var navgali = component.find('gali').get('v.value');
        var navanalis = component.find('analisper').get('v.value');
        var navsolusi = component.find('solusi').get('v.value');

        var navmpsu = component.find('jawabpert').get('v.value');
        var navpenc = component.find('catat').get('v.value');
        var navmaint = component.find('mainChat').get('v.value');

        var navpent = component.find('penutup').get('v.value');

        var navpinf = component.find('Remarks').get('v.value');

        if (subfree == '') {
            component.set('v.errMsg', 'Subject must be filled');
        } else if (navsp == undefined ||navsp=='choose one...' ) {
            component.set('v.errMsg', 'Salam Pembuka must be filled');
        } else if (navresp == undefined ||navresp == 'choose one...') {
            component.set('v.errMsg', 'First Response and Next Response must be filled');
        } else if (navsapa == undefined || navsapa == 'choose one...') {
            component.set('v.errMsg', 'Sapa nama pemilik akun must be filled');
        } else if (navpengbas == undefined || navpengbas == 'choose one...') {
            component.set('v.errMsg', 'Penggunaan bahasa dan singkatan umum must be filled');
        } else if (navpengjar == undefined || navpengjar == 'choose one...') {
            component.set('v.errMsg', 'Penggunaan Jargon must be filled');
        } else if (navemp == undefined || navemp == 'choose one...') {
            component.set('v.errMsg', 'empati must be filled');
        } else if (navgali == undefined || navgali == 'choose one...') {
            component.set('v.errMsg', 'gali info must be filled');
        } else if (navanalis == undefined || navanalis == 'choose one...') {
            component.set('v.errMsg', 'Analisa permasalahan must be filled');
        } else if (navsolusi == undefined || navsolusi == 'choose one...') {
            component.set('v.errMsg', 'Memberikan solusi must be filled');
        } else if (navmpsu == undefined || navmpsu == 'choose one...') {
            component.set('v.errMsg', 'Menjawab semua pertanyaan user must be filled');
        } else if (navpenc == undefined || navpenc == 'choose one...') {
            component.set('v.errMsg', 'Lakukan Pencatatan must be filled');
        } else if (navmaint == undefined || navmaint == 'choose one...') {
            component.set('v.errMsg', 'Maintenance Chat must be filled');
        } else if (navpent == undefined || navpent == 'choose one...') {
            component.set('v.errMsg', 'Salam Penutup must be filled');
        } else if (navpinf == undefined || navpinf == 'choose one...') {
            component.set('v.errMsg', 'Remarks Pujian must be filled');
        } else {
            component.set('v.errMsg', '');
            helper.save_data(component);
        }

    },
    changeSP: function (component, event, helper) {
        var IdSel = component.find("salampem");
        var val = IdSel.get('v.value');

        var IdRp = component.find("Remarks");
        var valRp = IdRp.get('v.value');
        var RPint = parseInt(valRp);

        var NotNum = component.get('v.SalpemScoreNA');
        var ParsNum = parseInt(NotNum) || 0;

        var NotNumpo = component.get('v.SalpemPointNA');
        var ParsNumpo = parseInt(NotNumpo) || 0;

        if (val == "choose one...") {
            component.set('v.input.Salam_Pembuka_Point__c', null);
            component.set('v.input.Salam_Pembuka_Score__c', null);

        } else if (val == "Pass") {
            component.set('v.input.Salam_Pembuka_Evaluation__c', val);
            component.set('v.input.Salam_Pembuka_Point__c', component.get('v.SalpemPointPass'));
            component.set('v.input.Salam_Pembuka_Score__c', component.get('v.SalpemScorePass'));

        } else if (val == "Fail") {
            component.set('v.input.Salam_Pembuka_Evaluation__c', val);
            component.set('v.input.Salam_Pembuka_Point__c', component.get('v.SalpemScoreFail'));
            component.set('v.input.Salam_Pembuka_Score__c', component.get('v.SalpemPointFail'));

        } else if (val == "N/A") {
            component.set('v.input.Salam_Pembuka_Evaluation__c', val);
            component.set('v.input.Salam_Pembuka_Point__c', ParsNumpo);
            component.set('v.input.Salam_Pembuka_Score__c', ParsNum);

        }

        var SP = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp = component.get('v.input.Empati_Score__c');
        var galiInf = component.get('v.input.Gali_Info_Score__c');
        var AnalPer = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal = SP + RespNext + Sapa + PengBas + PengJar + Emp + galiInf + AnalPer + Memsos + MSPU
            + LakPen + Mainten + Penutup;
        
        alltotal = alltotal || 0;

        component.set('v.input.Total_Score__c', alltotal);

        if (alltotal < 100 && RPint == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal + 3);
        } else if (alltotal < 100 && RPint == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal);
        } else if (alltotal >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeRespNext: function (component, event, helper) {

        var IdSel1 = component.find("firstresp");
        var val1 = IdSel1.get('v.value');

        var IdRp1 = component.find("Remarks");
        var valRp1 = IdRp1.get('v.value');
        var RPint1 = parseInt(valRp1);

        var NotNum1 = component.get('v.FirstRespScoreNA');
        var ParsNum1 = parseInt(NotNum1) || 0;
        
        var NotNumpo1 = component.get('v.FirstRespPointNA');
        var ParsNumpo1 = parseInt(NotNumpo1) || 0;

        if (val1 == "choose one...") {
            component.set('v.input.First_Response_Next_Response__c', null);
            component.set('v.input.First_Response_Next_Response_Score__c', null);

        } else if (val1 == "Pass") {
            component.set('v.input.First_Response_Next_Response_Evaluation__c', val1);
            component.set('v.input.First_Response_Next_Response__c', component.get('v.FirstRespPointPass'));
            component.set('v.input.First_Response_Next_Response_Score__c', component.get('v.FirstRespScorePass'));

        } else if (val1 == "Fail") {
            component.set('v.input.First_Response_Next_Response_Evaluation__c', val1);
            component.set('v.input.First_Response_Next_Response__c', component.get('v.FirstRespPointFail'));
            component.set('v.input.First_Response_Next_Response_Score__c', component.get('v.FirstRespScoreFail'));

        } else if (val1 == "N/A") {
            component.set('v.input.First_Response_Next_Response_Evaluation__c', val1);
            component.set('v.input.First_Response_Next_Response__c', ParsNumpo1);
            component.set('v.input.First_Response_Next_Response_Score__c', ParsNum1);

        }

        var SP1 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext1 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa1 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas1 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar1 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp1 = component.get('v.input.Empati_Score__c');
        var galiInf1 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer1 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos1 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU1 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen1 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten1 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup1 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal1 = SP1 + RespNext1 + Sapa1 + PengBas1 + PengJar1 + Emp1 + galiInf1 + AnalPer1 + Memsos1 + MSPU1
            + LakPen1 + Mainten1 + Penutup1

            alltotal1 = alltotal1 || 0;

        component.set('v.input.Total_Score__c', alltotal1);

        if (alltotal1 < 100 && RPint1 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal1 + 3);
        } else if (alltotal1 < 100 && RPint1 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal1);
        } else if (alltotal1 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }

    },
    changeSapa: function (component, event, helper) {

        var IdSel2 = component.find("sapaName");
        var val2 = IdSel2.get('v.value');

        var IdRp2 = component.find("Remarks");
        var valRp2 = IdRp2.get('v.value');
        var RPint2 = parseInt(valRp2);

        var NotNum2 = component.get('v.SapaScoreNA');
        var ParsNum2 = parseInt(NotNum2) || 0;

        var NotNumpo2 = component.get('v.SapaPointNA');
        var ParsNumpo2 = parseInt(NotNumpo2) || 0;

        if (val2 == "choose one...") {
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Point__c', null);
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Score__c', null);

        } else if (val2 == "Pass") {
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Evaluation__c', val2);
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Point__c', component.get('v.SapaPointPass'));
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Score__c', component.get('v.SapaScorePass'));

        } else if (val2 == "Fail") {
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Evaluation__c', val2);
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Point__c', component.get('v.SapaPointFail'));
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Score__c', component.get('v.SapaScoreFail'));

        } else if (val2 == "N/A") {
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Evaluation__c', val2);
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Point__c', ParsNumpo2);
            component.set('v.input.Sapa_Nama_Pemilik_Akun_Score__c', ParsNum2);

        }

        var SP2 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext2 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa2 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas2 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar2 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp2 = component.get('v.input.Empati_Score__c');
        var galiInf2 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer2 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos2 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU2 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen2 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten2 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup2 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal2 = SP2 + RespNext2 + Sapa2 + PengBas2 + PengJar2 + Emp2 + galiInf2 + AnalPer2 + Memsos2 + MSPU2
            + LakPen2 + Mainten2 + Penutup2;

            alltotal2 = alltotal2 || 0;

        component.set('v.input.Total_Score__c', alltotal2);

        if (alltotal2 < 100 && RPint2 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal2 + 3);
        } else if (alltotal2 < 100 && RPint2 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal2);
        } else if (alltotal2 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changePengBas: function (component, event, helper) {

        var IdSel3 = component.find("pengbas");
        var val3 = IdSel3.get('v.value');

        var IdRp3 = component.find("Remarks");
        var valRp3 = IdRp3.get('v.value');
        var RPint3 = parseInt(valRp3);

        var NotNum3 = component.get('v.PengBahasaScoreNA');
        var ParsNum3 = parseInt(NotNum3) || 0;

        var NotNumpo3 = component.get('v.PengBahasaPointNA');
        var ParsNumpo3 = parseInt(NotNumpo3) || 0;

        if (val3 == "choose one...") {
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Point__c', null);
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Score__c', null);

        } else if (val3 == "Pass") {
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Evaluation__c', val3);
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Point__c', component.get('v.PengBahasaPointPass'));
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Score__c', component.get('v.PengBahasaScorePass'));

        } else if (val3 == "Fail") {
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Evaluation__c', val3);
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Point__c', component.get('v.PengBahasaPointFail'));
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Score__c', component.get('v.PengBahasaScoreFail'));

        } else if (val3 == "N/A") {
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Evaluation__c', val3);
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Point__c', ParsNumpo3);
            component.set('v.input.Penggunaan_Bahasa_Singkatan_Score__c', ParsNum3);

        }

        var SP3 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext3 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa3 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas3 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar3 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp3 = component.get('v.input.Empati_Score__c');
        var galiInf3 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer3 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos3 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU3 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen3 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten3 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup3 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal3 = SP3 + RespNext3 + Sapa3 + PengBas3 + PengJar3 + Emp3 + galiInf3 + AnalPer3 + Memsos3 + MSPU3
            + LakPen3 + Mainten3 + Penutup3;

            alltotal3 = alltotal3 || 0;

        component.set('v.input.Total_Score__c', alltotal3);

        if (alltotal3 < 100 && RPint3 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal3 + 3);
        } else if (alltotal3 < 100 && RPint3 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal3);
        } else if (alltotal3 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changePengJar: function (component, event, helper) {

        var IdSel4 = component.find("pengjar");
        var val4 = IdSel4.get('v.value');

        var IdRp4 = component.find("Remarks");
        var valRp4 = IdRp4.get('v.value');
        var RPint4 = parseInt(valRp4);

        var NotNum4 = component.get('v.PengJargonScoreNA');
        var ParsNum4 = parseInt(NotNum4) || 0;

        var NotNumpo4 = component.get('v.PengJargonPointNA');
        var ParsNumpo4 = parseInt(NotNumpo4) || 0;

        if (val4 == "choose one...") {
            component.set('v.input.Penggunaan_Jargon_Point__c', null);
            component.set('v.input.Penggunaan_Jargon_Score__c', null);

        } else if (val4 == "Pass") {
            component.set('v.input.Penggunaan_Jargon__c', val4);
            component.set('v.input.Penggunaan_Jargon_Point__c', component.get('v.PengJargonPointPass'));
            component.set('v.input.Penggunaan_Jargon_Score__c', component.get('v.PengJargonScorePass'));

        } else if (val4 == "Fail") {
            component.set('v.input.Penggunaan_Jargon__c', val4);
            component.set('v.input.Penggunaan_Jargon_Point__c', component.get('v.PengJargonPointFail'));
            component.set('v.input.Penggunaan_Jargon_Score__c', component.get('v.PengJargonScoreFail'));

        } else if (val4 == "N/A") {
            component.set('v.input.Penggunaan_Jargon__c', val4);
            component.set('v.input.Penggunaan_Jargon_Point__c', ParsNumpo4);
            component.set('v.input.Penggunaan_Jargon_Score__c', ParsNum4);

        }

        var SP4 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext4 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa4 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas4 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar4 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp4 = component.get('v.input.Empati_Score__c');
        var galiInf4 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer4 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos4 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU4 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen4 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten4 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup4 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal4 = SP4 + RespNext4 + Sapa4 + PengBas4 + PengJar4 + Emp4 + galiInf4 + AnalPer4 + Memsos4 + MSPU4
            + LakPen4 + Mainten4 + Penutup4;

            alltotal4 = alltotal4 || 0;

        component.set('v.input.Total_Score__c', alltotal4);

        if (alltotal4 < 100 && RPint4 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal4 + 3);
        } else if (alltotal4 < 100 && RPint4 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal4);
        } else if (alltotal4 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeEmp: function (component, event, helper) {

        var IdSel5 = component.find("empati");
        var val5 = IdSel5.get('v.value');

        var IdRp5 = component.find("Remarks");
        var valRp5 = IdRp5.get('v.value');
        var RPint5 = parseInt(valRp5);

        var NotNum5 = component.get('v.EmpatiScoreNA');
        var ParsNum5 = parseInt(NotNum5) || 0;

        var NotNumpo5 = component.get('v.EmpatiPointNA');
        var ParsNumpo5 = parseInt(NotNumpo5) || 0;

        if (val5 == "choose one...") {
            component.set('v.input.Empati_Point__c', null);
            component.set('v.input.Empati_Score__c', null);

        } else if (val5 == "Pass") {
            component.set('v.input.Empati_Evaluation__c', val5);
            component.set('v.input.Empati_Point__c', component.get('v.EmpatiPointPass'));
            component.set('v.input.Empati_Score__c', component.get('v.EmpatiScorePass'));

        } else if (val5 == "Fail") {
            component.set('v.input.Empati_Evaluation__c', val5);
            component.set('v.input.Empati_Point__c', component.get('v.EmpatiPointFail'));
            component.set('v.input.Empati_Score__c', component.get('v.EmpatiScoreFail'));

        } else if (val5 == "N/A") {
            component.set('v.input.Empati_Evaluation__c', val5);
            component.set('v.input.Empati_Point__c', ParsNumpo5);
            component.set('v.input.Empati_Score__c', ParsNum5);

        }

        var SP5 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext5 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa5 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas5 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar5 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp5 = component.get('v.input.Empati_Score__c');
        var galiInf5 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer5 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos5 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU5 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen5 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten5 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup5 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal5 = SP5 + RespNext5 + Sapa5 + PengBas5 + PengJar5 + Emp5 + galiInf5 + AnalPer5 + Memsos5 + MSPU5
            + LakPen5 + Mainten5 + Penutup5;

            alltotal5 = alltotal5 || 0;

        component.set('v.input.Total_Score__c', alltotal5);

        if (alltota5 < 100 && RPint5 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltota5 + 3);
        } else if (alltota5 < 100 && RPint5 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltota5);
        } else if (alltota5 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeGaliInf: function (component, event, helper) {

        var IdSel6 = component.find("gali");
        var val6 = IdSel6.get('v.value');

        var IdRp6 = component.find("Remarks");
        var valRp6 = IdRp6.get('v.value');
        var RPint6 = parseInt(valRp6);

        var NotNum6 = component.get('v.GaliScoreNA');
        var ParsNum6 = parseInt(NotNum6) || 0;

        var NotNumpo6 = component.get('v.GaliPointNA');
        var ParsNumpo6 = parseInt(NotNumpo6) || 0;

        if (val6 == "choose one...") {
            component.set('v.input.Gali_Info_Point__c', null);
            component.set('v.input.Gali_Info_Score__c', null);

        } else if (val6 == "Pass") {
            component.set('v.input.Gali_Info_Evaluation__c', val6);
            component.set('v.input.Gali_Info_Point__c', component.get('v.GaliPointPass'));
            component.set('v.input.Gali_Info_Score__c', component.get('v.GaliScorePass'));

        } else if (val6 == "Fail") {
            component.set('v.input.Gali_Info_Evaluation__c', val6);
            component.set('v.input.Gali_Info_Point__c', component.get('v.GaliPointFail'));
            component.set('v.input.Gali_Info_Score__c', component.get('v.GaliScoreFail'));

        } else if (val6 == "N/A") {
            component.set('v.input.Gali_Info_Evaluation__c', val6);
            component.set('v.input.Gali_Info_Point__c', ParsNumpo6);
            component.set('v.input.Gali_Info_Score__c', ParsNum6);

        }

        var SP6 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext6 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa6 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas6 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar6 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp6 = component.get('v.input.Empati_Score__c');
        var galiInf6 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer6 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos6 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU6 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen6 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten6 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup6 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal6 = SP6 + RespNext6 + Sapa6 + PengBas6 + PengJar6 + Emp6 + galiInf6 + AnalPer6 + Memsos6 + MSPU6
            + LakPen6 + Mainten6 + Penutup6;

            alltotal6 = alltotal6 || 0;

        component.set('v.input.Total_Score__c', alltotal6);

        if (alltotal6 < 100 && RPint6 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal6 + 3);
        } else if (alltotal6 < 100 && RPint6 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal6);
        } else if (alltotal6 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeAnalPer: function (component, event, helper) {

        var IdSel7 = component.find("analisper");
        var val7 = IdSel7.get('v.value');

        var IdRp7 = component.find("Remarks");
        var valRp7 = IdRp7.get('v.value');
        var RPint7 = parseInt(valRp7);

        var NotNum7 = component.get('v.AnalisScoreNA');
        var ParsNum7 = parseInt(NotNum7) || 0;
        
        var NotNumpo7 = component.get('v.AnalisPointNA');
        var ParsNumpo7 = parseInt(NotNumpo7) || 0;

        if (val7 == "choose one...") {
            component.set('v.input.Analisa_Permasalahan_Point__c', null);
            component.set('v.input.Analisa_Permasalahan_Score__c', null);

        } else if (val7 == "Excellent") {
            component.set('v.input.Analisa_Permasalahan_Evaluation__c', val7);
            component.set('v.input.Analisa_Permasalahan_Point__c', component.get('v.AnalisPointExcellent'));
            component.set('v.input.Analisa_Permasalahan_Score__c', component.get('v.AnalisScoreExcellent'));

        } else if (val7 == "Poor") {
            component.set('v.input.Analisa_Permasalahan_Evaluation__c', val7);
            component.set('v.input.Analisa_Permasalahan_Point__c', component.get('v.AnalisPointPoor'));
            component.set('v.input.Analisa_Permasalahan_Score__c', component.get('v.AnalisScorePoor'));

        } else if (val7 == "N/A") {
            component.set('v.input.Analisa_Permasalahan_Evaluation__c', val7);
            component.set('v.input.Analisa_Permasalahan_Point__c', ParsNumpo7);
            component.set('v.input.Analisa_Permasalahan_Score__c', ParsNum7);

        }

        var SP7 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext7 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa7 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas7 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar7 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp7 = component.get('v.input.Empati_Score__c');
        var galiInf7 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer7 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos7 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU7 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen7 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten7 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup7 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal7 = SP7 + RespNext7 + Sapa7 + PengBas7 + PengJar7 + Emp7 + galiInf7 + AnalPer7 + Memsos7 + MSPU7
            + LakPen7 + Mainten7 + Penutup7;

            alltotal7 = alltotal7 || 0;

        component.set('v.input.Total_Score__c', alltotal7);

        if (alltotal7 < 100 && RPint7 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal7 + 3);
        } else if (alltotal7 < 100 && RPint7 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal7);
        } else if (alltotal7 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeMemSos: function (component, event, helper) {

        var IdSel8 = component.find("solusi");
        var val8 = IdSel8.get('v.value');

        var IdRp8 = component.find("Remarks");
        var valRp8 = IdRp8.get('v.value');
        var RPint8 = parseInt(valRp8);

        var NotNum8 = component.get('v.SolusiScoreNA');
        var ParsNum8 = parseInt(NotNum8) || 0;

        var NotNumpo8 = component.get('v.SolusiPointNA');
        var ParsNumpo8 = parseInt(NotNumpo8) || 0;

        if (val8 == "choose one...") {
            component.set('v.input.Memberikan_Solusi_Point__c', null);
            component.set('v.input.Memberikan_Solusi_Score__c', null);

        } else if (val8 == "Excellent") {
            component.set('v.input.Memberikan_Solusi_Evaluation__c', val8);
            component.set('v.input.Memberikan_Solusi_Point__c', component.get('v.SolusiPointExcellent'));
            component.set('v.input.Memberikan_Solusi_Score__c', component.get('v.SolusiScoreExcellent'));

        } else if (val8 == "Poor") {
            component.set('v.input.Memberikan_Solusi_Evaluation__c', val8);
            component.set('v.input.Memberikan_Solusi_Point__c', component.get('v.SolusiPointFail'));
            component.set('v.input.Memberikan_Solusi_Score__c', component.get('v.SolusiScoreFail'));

        } else if (val8 == "Fail") {
            component.set('v.input.Memberikan_Solusi_Evaluation__c', val8);
            component.set('v.input.Memberikan_Solusi_Point__c', component.get('v.SolusiPointPoor'));
            component.set('v.input.Memberikan_Solusi_Score__c', component.get('v.SolusiScorePoor'));

        } else if (val8 == "N/A") {
            component.set('v.input.Memberikan_Solusi_Evaluation__c', val8);
            component.set('v.input.Memberikan_Solusi_Point__c', ParsNumpo8);
            component.set('v.input.Memberikan_Solusi_Score__c', ParsNum8);

        }

        var SP8 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext8 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa8 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas8 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar8 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp8 = component.get('v.input.Empati_Score__c');
        var galiInf8 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer8 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos8 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU8 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen8 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten8 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup8 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal8 = SP8 + RespNext8 + Sapa8 + PengBas8 + PengJar8 + Emp8 + galiInf8 + AnalPer8 + Memsos8 + MSPU8
            + LakPen8 + Mainten8 + Penutup8;

            alltotal8 = alltotal8 || 0;

        component.set('v.input.Total_Score__c', alltotal8);

        if (alltotal8 < 100 && RPint8 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal8 + 3);
        } else if (alltotal8 < 100 && RPint8 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal8);
        } else if (alltotal8 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeMSPU: function (component, event, helper) {

        var IdSel9 = component.find("jawabpert");
        var val9 = IdSel9.get('v.value');

        var IdRp9 = component.find("Remarks");
        var valRp9 = IdRp9.get('v.value');
        var RPint9 = parseInt(valRp9);

        var NotNum9 = component.get('v.MenjawabScoreNA');
        var ParsNum9 = parseInt(NotNum9) || 0;

        var NotNumpo9 = component.get('v.MenjawabPointNA');
        var ParsNumpo9 = parseInt(NotNumpo9) || 0;

        if (val9 == "choose one...") {
            component.set('v.input.Menjawab_Semua_Pertanyaan_Point__c', null);
            component.set('v.input.Menjawab_Semua_Pertanyaan_Score__c', null);

        } else if (val9 == "Excellent") {
            component.set('v.input.Menjawab_Semua_Pertanyaan_Evaluation__c', val9);
            component.set('v.input.Menjawab_Semua_Pertanyaan_Point__c', component.get('v.MenjawabPointExcellent'));
            component.set('v.input.Menjawab_Semua_Pertanyaan_Score__c', component.get('v.MenjawabScoreExcellent'));

        } else if (val9 == "Fail") {
            component.set('v.input.Menjawab_Semua_Pertanyaan_Evaluation__c', val9);
            component.set('v.input.Menjawab_Semua_Pertanyaan_Point__c', component.get('v.MenjawabPointFail'));
            component.set('v.input.Menjawab_Semua_Pertanyaan_Score__c', component.get('v.MenjawabScoreFail'));

        } else if (val9 == "N/A") {
            component.set('v.input.Menjawab_Semua_Pertanyaan_Evaluation__c', val9);
            component.set('v.input.Menjawab_Semua_Pertanyaan_Point__c', ParsNumpo9);
            component.set('v.input.Menjawab_Semua_Pertanyaan_Score__c', ParsNum9);

        }

        var SP9 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext9 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa9 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas9 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar9 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp9 = component.get('v.input.Empati_Score__c');
        var galiInf9 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer9 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos9 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU9 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen9 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten9 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup9 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal9 = SP9 + RespNext9 + Sapa9 + PengBas9 + PengJar9 + Emp9 + galiInf9 + AnalPer9 + Memsos9 + MSPU9
            + LakPen9 + Mainten9 + Penutup9;

            alltotal9 = alltotal9 || 0;

        component.set('v.input.Total_Score__c', alltotal9);

        if (alltotal9 < 100 && RPint9 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal9 + 3);
        } else if (alltotal9 < 100 && RPint9 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal9);
        } else if (alltotal9 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeLakPen: function (component, event, helper) {

        var IdSel10 = component.find("catat");
        var val10 = IdSel10.get('v.value');

        var IdRp10 = component.find("Remarks");
        var valRp10 = IdRp10.get('v.value');
        var RPint10 = parseInt(valRp10);

        var NotNum10 = component.get('v.PencatatanScoreNA');
        var ParsNum10 = parseInt(NotNum10) || 0;

        var NotNumpo10 = component.get('v.PencatatanPointNA');
        var ParsNumpo10 = parseInt(NotNumpo10) || 0;

        if (val10 == "choose one...") {
            component.set('v.input.Lakukan_Pencatatan_Point__c', null);
            component.set('v.input.Lakukan_Pencatatan_Score__c', null);

        } else if (val10 == "Excellent") {
            component.set('v.input.Lakukan_Pencatatan_Evaluation__c', val10);
            component.set('v.input.Lakukan_Pencatatan_Point__c', component.get('v.PencatatanPointExcellent'));
            component.set('v.input.Lakukan_Pencatatan_Score__c', component.get('v.PencatatanScoreExcellent'));

        } else if (val10 == "Fail") {
            component.set('v.input.Lakukan_Pencatatan_Evaluation__c', val10);
            component.set('v.input.Lakukan_Pencatatan_Point__c', component.get('v.PencatatanPointFail'));
            component.set('v.input.Lakukan_Pencatatan_Score__c', component.get('v.PencatatanScoreFail'));

        } else if (val10 == "N/A") {
            component.set('v.input.Lakukan_Pencatatan_Evaluation__c', val10);
            component.set('v.input.Lakukan_Pencatatan_Point__c', ParsNumpo10);
            component.set('v.input.Lakukan_Pencatatan_Score__c', ParsNum10);

        }

        var SP10 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext10 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa10 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas10 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar10 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp10 = component.get('v.input.Empati_Score__c');
        var galiInf10 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer10 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos10 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU10 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen10 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten10 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup10 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal10 = SP10 + RespNext10 + Sapa10 + PengBas10 + PengJar10 + Emp10 + galiInf10 + AnalPer10 + Memsos10 + MSPU10
            + LakPen10 + Mainten10 + Penutup10;

            alltotal10 = alltotal10 || 0;

        component.set('v.input.Total_Score__c', alltotal10);

        if (alltotal10 < 100 && RPint10 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal10 + 3);
        } else if (alltotal10 < 100 && RPint10 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal10);
        } else if (alltotal10 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeMainten: function (component, event, helper) {

        var IdSel11 = component.find("mainChat");
        var val11 = IdSel11.get('v.value');

        var IdRp11 = component.find("Remarks");
        var valRp11 = IdRp11.get('v.value');
        var RPint11 = parseInt(valRp11);

        var NotNum11 = component.get('v.MaintenanceScoreNA');
        var ParsNum11 = parseInt(NotNum11) || 0;

        var NotNumpo11 = component.get('v.MaintenancePointNA');
        var ParsNumpo11 = parseInt(NotNumpo11) || 0;

        if (val11 == "choose one...") {
            component.set('v.input.Maintenance_Chat_Point__c', null);
            component.set('v.input.Maintenance_Chat_Score__c', null);

        } else if (val11 == "Meet Expectation") {
            component.set('v.input.Maintenance_Chat_Evaluation__c', val11);
            component.set('v.input.Maintenance_Chat_Point__c', component.get('v.MaintenancePointMeetExpect'));
            component.set('v.input.Maintenance_Chat_Score__c', component.get('v.MaintenanceScoreMeetExpect'));

        } else if (val11 == "Poor") {
            component.set('v.input.Maintenance_Chat_Evaluation__c', val11);
            component.set('v.input.Maintenance_Chat_Point__c', component.get('v.MaintenancePointPoor'));
            component.set('v.input.Maintenance_Chat_Score__c', component.get('v.MaintenanceScorePoor'));

        } else if (val11 == "Fail") {
            component.set('v.input.Maintenance_Chat_Evaluation__c', val11);
            component.set('v.input.Maintenance_Chat_Point__c', component.get('v.MaintenancePointFail'))
            component.set('v.input.Maintenance_Chat_Score__c', component.get('v.MaintenanceScoreFail'));

        } else if (val11 == "N/A") {
            component.set('v.input.Maintenance_Chat_Evaluation__c', val11);
            component.set('v.input.Maintenance_Chat_Point__c', ParsNumpo11);
            component.set('v.input.Maintenance_Chat_Score__c', ParsNum11);

        }

        var SP11 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext11 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa11 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas11 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar11 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp11 = component.get('v.input.Empati_Score__c');
        var galiInf11 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer11 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos11 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU11 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen11 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten11 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup11 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal11 = SP11 + RespNext11 + Sapa11 + PengBas11 + PengJar11 + Emp11 + galiInf11 + AnalPer11 + Memsos11 + MSPU11
            + LakPen11 + Mainten11 + Penutup11;

            alltotal11 = alltotal11 || 0;

        component.set('v.input.Total_Score__c', alltotal11);

        if (alltotal11 < 100 && RPint11 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal11 + 3);
        } else if (alltotal11 < 100 && RPint11 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal11);
        } else if (alltotal11 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changePenutup: function (component, event, helper) {

        var IdSel12 = component.find("penutup");
        var val12 = IdSel12.get('v.value');

        var IdRp12 = component.find("Remarks");
        var valRp12 = IdRp12.get('v.value');
        var RPint12 = parseInt(valRp12);

        var NotNum12 = component.get('v.PenutupScoreNA');
        var ParsNum12 = parseInt(NotNum12) || 0;

        var NotNumpo12 = component.get('v.PenutupPointNA');
        var ParsNumpo12 = parseInt(NotNumpo12) || 0;

        if (val12 == "choose one...") {
            component.set('v.input.Salam_Penutup_Point__c', null);
            component.set('v.input.Salam_Penutup_Score__c', null);

        } else if (val12 == "Pass") {
            component.set('v.input.Salam_Penutup_Evaluation__c', val12);
            component.set('v.input.Salam_Penutup_Point__c', component.get('v.PenutupPointPass'));
            component.set('v.input.Salam_Penutup_Score__c', component.get('v.PenutupScorePass'));

        } else if (val12 == "Fail") {
            component.set('v.input.Salam_Penutup_Evaluation__c', val12);
            component.set('v.input.Salam_Penutup_Point__c', component.get('v.PenutupPointFail'));
            component.set('v.input.Salam_Penutup_Score__c', component.get('v.PenutupScoreFail'));

        } else if (val12 == "N/A") {
            component.set('v.input.Salam_Penutup_Evaluation__c', val12);
            component.set('v.input.Salam_Penutup_Point__c', ParsNumpo12);
            component.set('v.input.Salam_Penutup_Score__c', ParsNum12);

        }

        var SP12 = component.get('v.input.Salam_Pembuka_Score__c');
        var RespNext12 = component.get('v.input.First_Response_Next_Response_Score__c');
        var Sapa12 = component.get('v.input.Sapa_Nama_Pemilik_Akun_Score__c');
        var PengBas12 = component.get('v.input.Penggunaan_Bahasa_Singkatan_Score__c');
        var PengJar12 = component.get('v.input.Penggunaan_Jargon_Score__c');
        var Emp12 = component.get('v.input.Empati_Score__c');
        var galiInf12 = component.get('v.input.Gali_Info_Score__c');
        var AnalPer12 = component.get('v.input.Analisa_Permasalahan_Score__c');
        var Memsos12 = component.get('v.input.Memberikan_Solusi_Score__c');
        var MSPU12 = component.get('v.input.Menjawab_Semua_Pertanyaan_Score__c');
        var LakPen12 = component.get('v.input.Lakukan_Pencatatan_Score__c');
        var Mainten12 = component.get('v.input.Maintenance_Chat_Score__c');
        var Penutup12 = component.get('v.input.Salam_Penutup_Score__c');

        var alltotal12 = SP12 + RespNext12 + Sapa12 + PengBas12 + PengJar12 + Emp12 + galiInf12 + AnalPer12 + Memsos12 + MSPU12
            + LakPen12 + Mainten12 + Penutup12;

            alltotal12 = alltotal12 || 0;

        component.set('v.input.Total_Score__c', alltotal12);

        if (alltotal12 < 100 && RPint12 == 1) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal12 + 3);
        } else if (alltotal12 < 100 && RPint12 == 0) {
            component.set('v.input.Score_and_Remarks_Pujian__c', alltotal12);
        } else if (alltotal12 >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },
    changeInf: function (component, event, helper) {
        var IdSel13 = component.find("Remarks");
        var val13 = IdSel13.get('v.value');
        var total = component.get('v.input.Total_Score__c');
        var nav_Val = parseInt(val13);

        if (total < 100 && nav_Val == 1) {
            component.set('v.input.Remarks_Pujian__c', nav_Val);
            component.set('v.input.Score_and_Remarks_Pujian__c', total + 3);

        } else if (total < 100 && nav_Val == 0) {
            component.set('v.input.Remarks_Pujian__c', nav_Val);
            component.set('v.input.Score_and_Remarks_Pujian__c', total);
        } else if (total >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },

    closeModel: function (component, event, helper) {
        component.set('v.errLimit', false);
    },

    doInit : function(component, event, helper) {
        console.log(component.get("v.recId"));
        console.log(component.get("v.recordId"));
        var act = component.get("c.Scoring");
        act.setCallback(this, function(result) {
            var statement = result.getState();
            console.log('ini masuk ke scoring');
            if(statement == "SUCCESS") {
                var respo = result.getReturnValue();
                //salpem
                component.set('v.SalpemScorePass',respo.SalpemScorePass);
                component.set('v.SalpemScoreFail',respo.SalpemScoreFail);
                component.set('v.SalpemScoreNA',respo.SalpemScoreNA);
                component.set('v.SalpemPointPass',respo.SalpemPointPass);
                component.set('v.SalpemPointFail',respo.SalpemPointFail);
                component.set('v.SalpemPointNA',respo.SalpemPointNA);
                //FirstResp
                component.set('v.FirstRespScorePass',respo.FirstRespScorePass);
                component.set('v.FirstRespScoreFail',respo.FirstRespScoreFail);               
                component.set('v.FirstRespScoreNA',respo.FirstRespScoreNA);
                component.set('v.FirstRespPointPass',respo.FirstRespPointPass);
                component.set('v.FirstRespPointFail',respo.FirstRespPointFail);
                component.set('v.FirstRespPointNA',respo.FirstRespPointNA);
                //Sapa
                component.set('v.SapaScorePass',respo.SapaScorePass);
                component.set('v.SapaScoreFail',respo.SapaScoreFail);               
                component.set('v.SapaScoreNA',respo.SapaScoreNA);
                component.set('v.SapaPointPass',respo.SapaPointPass);
                component.set('v.SapaPointFail',respo.SapaPointFail);
                component.set('v.SapaPointNA',respo.SapaPointNA);
                //Pengbas
                component.set('v.PengBahasaScorePass',respo.PengBahasaScorePass);
                component.set('v.PengBahasaScoreFail',respo.PengBahasaScoreFail);               
                component.set('v.PengBahasaScoreNA',respo.PengBahasaScoreNA);
                component.set('v.PengBahasaPointPass',respo.PengBahasaPointPass);
                component.set('v.PengBahasaPointFail',respo.PengBahasaPointFail);
                component.set('v.PengBahasaPointNA',respo.PengBahasaPointNA);
                //PengJargon
                component.set('v.PengJargonScorePass',respo.PengJargonScorePass);
                component.set('v.PengJargonScoreFail',respo.PengJargonScoreFail);               
                component.set('v.PengJargonScoreNA',respo.PengJargonScoreNA);
                component.set('v.PengJargonPointPass',respo.PengJargonPointPass);
                component.set('v.PengJargonPointFail',respo.PengJargonPointFail);
                component.set('v.PengJargonPointNA',respo.PengJargonPointNA);
                //empati
                component.set('v.EmpatiScorePass',respo.EmpatiScorePass);
                component.set('v.EmpatiScoreFail',respo.EmpatiScoreFail);               
                component.set('v.EmpatiScoreNA',respo.EmpatiScoreNA);
                component.set('v.EmpatiPointPass',respo.EmpatiPointPass);
                component.set('v.EmpatiPointFail',respo.EmpatiPointFail);
                component.set('v.EmpatiPointNA',respo.EmpatiPointNA);
                //gali
                component.set('v.GaliScorePass',respo.GaliScorePass);
                component.set('v.GaliScoreFail',respo.GaliScoreFail);               
                component.set('v.GaliScoreNA',respo.GaliScoreNA);
                component.set('v.GaliPointPass',respo.GaliPointPass);
                component.set('v.GaliPointFail',respo.GaliPointFail);
                component.set('v.GaliPointNA',respo.GaliPointNA);
                //analisis
                component.set('v.AnalisScoreExcellent',respo.AnalisScoreExcellent);
                component.set('v.AnalisScorePoor',respo.AnalisScorePoor);               
                component.set('v.AnalisScoreNA',respo.AnalisScoreNA);
                component.set('v.AnalisPointExcellent',respo.AnalisPointExcellent);
                component.set('v.AnalisPointPoor',respo.AnalisPointPoor);
                component.set('v.AnalisPointNA',respo.AnalisPointNA);
                //solusi
                component.set('v.SolusiScoreExcellent',respo.SolusiScoreExcellent);
                component.set('v.SolusiScoreFail',respo.SolusiScoreFail);               
                component.set('v.SolusiScorePoor',respo.SolusiScorePoor);
                component.set('v.SolusiScoreNA',respo.SolusiScoreNA);
                component.set('v.SolusiPointExcellent',respo.SolusiPointExcellent);
                component.set('v.SolusiPointFail',respo.SolusiPointFail);
                component.set('v.SolusiPointPoor',respo.SolusiPointPoor);
                component.set('v.SolusiPointNA',respo.SolusiPointNA);
                //Menjawab
                component.set('v.MenjawabScoreExcellent',respo.MenjawabScoreExcellent);
                component.set('v.MenjawabScoreFail',respo.MenjawabScoreFail);               
                component.set('v.MenjawabScoreNA',respo.MenjawabScoreNA);
                component.set('v.MenjawabPointExcellent',respo.MenjawabPointExcellent);
                component.set('v.MenjawabPointFail',respo.MenjawabPointFail);
                component.set('v.MenjawabPointNA',respo.MenjawabPointNA);
                //pencatatan
                component.set('v.PencatatanScoreExcellent',respo.PencatatanScoreExcellent);
                component.set('v.PencatatanScoreFail',respo.PencatatanScoreFail);               
                component.set('v.PencatatanScoreNA',respo.PencatatanScoreNA);
                component.set('v.PencatatanPointExcellent',respo.PencatatanPointExcellent);
                component.set('v.PencatatanPointFail',respo.PencatatanPointFail);
                component.set('v.PencatatanPointNA',respo.PencatatanPointNA);
                //maintenance
                component.set('v.MaintenanceScoreMeetExpect',respo.MaintenanceScoreMeetExpect);
                component.set('v.MaintenanceScorePoor',respo.MaintenanceScorePoor);               
                component.set('v.MaintenanceScoreFail',respo.MaintenanceScoreFail);
                component.set('v.MaintenanceScoreNA',respo.MaintenanceScoreNA);
                component.set('v.MaintenancePointMeetExpect',respo.MaintenancePointMeetExpect);
                component.set('v.MaintenancePointPoor',respo.MaintenancePointPoor);
                component.set('v.MaintenancePointFail',respo.MaintenancePointFail);
                component.set('v.MaintenancePointNA',respo.MaintenancePointNA);
                //penutup
                component.set('v.PenutupScorePass',respo.PenutupScorePass);
                component.set('v.PenutupScoreFail',respo.PenutupScoreFail);               
                component.set('v.PenutupScoreNA',respo.PenutupScoreNA);
                component.set('v.PenutupPointPass',respo.PenutupPointPass);
                component.set('v.PenutupPointFail',respo.PenutupPointFail);
                component.set('v.PenutupPointNA',respo.PenutupPointNA);
                
            }
        });
        $A.enqueueAction(act);
        var action = '';
        // this is for edit
        if(component.get("v.recordId") != null) {
            component.set("v.recId",component.get('v.recordId'));
            component.set("v.edited",'edited');
            action = component.get("c.getAssessmentData");
            action.setParams({
                "assessmentId" : component.get("v.recordId"),
                edit : component.get('v.edited')
            });
        }else {
            action = component.get("c.getAssessmentData");
            action.setParams({
                "assessmentId" : component.get("v.recId")
            });
        }
        action.setCallback(this, function(e) {
            console.log('state Init '+e.getState());
            var result = e.getReturnValue();
            if(e.getState()=='SUCCESS'){
                console.log(result);
                if(result != null) {
                    component.set('v.input', result);
                }
                //component.set('v.input.Subject_Custom__c',)
                // component.set("v.caseList",result);
                // var caseList = component.get("v.caseList");
                // for(var i=0;i<caseList.length;i++) {
                //     console.log(caseList[i]);
                // }
            }
            if(result == null) {
                component.set('v.errLimit',true);
            }
        });
        $A.enqueueAction(action);    
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabLabel({
                tabId: focusedTabId,
                label: "Live Chat Assessment"
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },

    cancelClick: function(component, event, helper){
        $A.get("e.force:closeQuickAction").fire();
    }

})