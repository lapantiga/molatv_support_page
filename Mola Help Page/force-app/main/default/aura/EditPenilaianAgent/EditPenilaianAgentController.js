({  
    btn_Save : function(component, event, helper) {
        var subfree = component.get('v.input.Subject_Custom__c');
        var navPS = component.find('select1').get('v.value');
        var navIA = component.find('select2').get('v.value');
        var navCP = component.find('select3').get('v.value');
        var navRP = component.find('select4').get('v.value');

        if(subfree == null || subfree == ''){
            console.log(subfree);
            console.log('err 1');
            component.set('v.errMsg', 'Subject must be filled');
        }
        else if(navPS == undefined || navPS =='choose one...'){
            console.log(navPS);
            console.log('err 2');
            component.set('v.errMsg', 'Response times must be filled');
        } 
        else if(navIA == undefined ||navIA == 'choose one...'){
            console.log(navIA);
            console.log('err 3');
            component.set('v.errMsg', 'Akurasi must be filled');
        } 
        else if(navCP == undefined || navCP == 'choose one...'){
            console.log(navCP);
            console.log('err 4');
            component.set('v.errMsg', 'Courtesy times must be filled');
        }
        else if(navRP == undefined || navRP == 'choose one...'){
            console.log(navCP);
            console.log('err 5');
            component.set('v.errMsg', 'Remarks Pujian times must be filled');
        }else{
            console.log(subfree);
            console.log(navPS);
            console.log(navIA);
            console.log(navCP);
            console.log(navRP);
            console.log('err 5');
            component.set('v.errMsg', '');
            helper.save_data(component);
        }
        
    },
    changePS : function(component, event, helper) {
        var sel = component.find("select1");
        var nav = sel.get('v.value');
        var selcrp = component.find("select4");
        var navrp = selcrp.get('v.value');
        var nav_Val1 = parseInt(navrp);
        var passPoint = 1;        
        if (nav =="choose one..."){
            component.set('v.input.Respon_Time_Point__c', null);
            component.set('v.input.Respon_Time_Score__c', null);
            console.log(component.get('v.input.Respon_Time_Score__c'));
        }else if (nav =="Pass"){
            component.set('v.input.Respon_Time_Evaluation__c', nav);
            component.set('v.input.Respon_Time_Point__c', component.get('v.respPointPass'));
            component.set('v.input.Respon_Time_Score__c', component.get('v.respScorePass'));
            console.log(component.get('v.input.Respon_Time_Score__c'));
        }else if(nav =="Fail"){
            component.set('v.input.Respon_Time_Evaluation__c', nav);
            component.set('v.input.Respon_Time_Point__c', component.get('v.respPointFail'))
            component.set('v.input.Respon_Time_Score__c', component.get('v.respScoreFail'));
            console.log(component.get('v.responseTimeFail'));
        }

        var q = component.get('v.input.Respon_Time_Score__c');
        var w = component.get('v.input.Information_Accuracy_Score__c');
        var e = component.get('v.input.Courtesy_Score__c');
        var r = q + w + e ;
        r = r || 0;
        var total = r + 1;
        component.set('v.input.Total_Score__c' , r);

        if (r < 100 && nav_Val1 == 1){ 
            component.set('v.input.Score_and_Remarks_Pujian__c', total );
        }else if(r < 100 && nav_Val1 == 0 ) {
            component.set('v.input.Score_and_Remarks_Pujian__c', r );
        }else if(r >= 100 ) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100 );
        }

    },
    changeIA : function(component, event, helper) {
        var selt = component.find("select2");
        var navi = selt.get('v.value');

        var selcrp1 = component.find("select4");
        var navrp1 = selcrp1.get('v.value');
        var nav_Val2 = parseInt(navrp1);

        if (navi =="choose one..."){
            component.set('v.input.Information_Accuracy_Point__c', null);
            component.set('v.input.Information_Accuracy_Score__c', null);
        }else if (navi =="Pass"){
            component.set('v.input.Information_Accuracy_Evaluation__c', navi);
            component.set('v.input.Information_Accuracy_Point__c' , component.get('v.InfoAkurPointPass'));
            component.set('v.input.Information_Accuracy_Score__c', component.get('v.InfoAkurScorePass'));
        }else if(navi =="Fail"){
            component.set('v.input.Information_Accuracy_Evaluation__c', navi);
            component.set('v.input.Information_Accuracy_Point__c', component.get('v.InfoAkurPointFail'))
            component.set('v.input.Information_Accuracy_Score__c', component.get('v.InfoAkurScoreFail'));
        }
        var s = component.get('v.input.Respon_Time_Score__c');
        var d = component.get('v.input.Information_Accuracy_Score__c');
        var f = component.get('v.input.Courtesy_Score__c');
        var g = s + d + f ;
        g = g || 0;
        var total1 = g + 1;
        component.set('v.input.Total_Score__c' , g);

        if (g < 100 && nav_Val2 == 1){ 
            component.set('v.input.Score_and_Remarks_Pujian__c', total1 );
        }else if(g < 100 && nav_Val2 == 0 ) {
            component.set('v.input.Score_and_Remarks_Pujian__c', g );
        }else if(g >= 100 ) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100 );
        }

    },
    changeCP : function(component, event, helper) {
        var selc = component.find("select3");
        var navt = selc.get('v.value');
       
        var selcrp2 = component.find("select4");
        var navrp2 = selcrp2.get('v.value');
        var nav_Val3 = parseInt(navrp2);

        if (navt =="choose one..."){
            component.set('v.input.Courtesy_Point__c', null);
            component.set('v.input.Courtesy_Score__c', null);
        }else if (navt =="Pass"){
            component.set('v.input.Courtesy__c', navt);
            component.set('v.input.Courtesy_Point__c' , component.get('v.CourtesyPointPass'));
            component.set('v.input.Courtesy_Score__c', component.get('v.CourtesyScorePass'));
        }else if(navt =="Fail"){
            component.set('v.input.Courtesy__c', navt);
            component.set('v.input.Courtesy_Point__c', component.get('v.CourtesyPointFail'))
            component.set('v.input.Courtesy_Score__c', component.get('v.CourtesyScoreFail'));
        }
        
        var x = component.get('v.input.Respon_Time_Score__c');
        var y = component.get('v.input.Information_Accuracy_Score__c');
        var z = component.get('v.input.Courtesy_Score__c');
        var a = x + y + z ;
        a = a || 0;
        var total3 = a + 1;
        component.set('v.input.Total_Score__c' , a);

        if (a < 100 && nav_Val3 == 1){ 
            component.set('v.input.Score_and_Remarks_Pujian__c', total3 );
        }else if(a < 100 && nav_Val3 == 0 ) {
            component.set('v.input.Score_and_Remarks_Pujian__c', a );
        }else if(a >= 100 ) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100 );
        }

    },
    changeRP : function(component, event, helper) {
        var selp = component.find("select4");
        var navo = selp.get('v.value');
        var total = component.get('v.input.Total_Score__c');
        var nav_Val = parseInt(navo);
        if (total < 100 && nav_Val == 1) {
            component.set('v.input.Remarks_Pujian__c', nav_Val);
            component.set('v.input.Score_and_Remarks_Pujian__c', total + 1);

        } else if (total < 100 && nav_Val == 0) {
            component.set('v.input.Remarks_Pujian__c', nav_Val);
            component.set('v.input.Score_and_Remarks_Pujian__c', total);
        } else if (total >= 100) {
            component.set('v.input.Score_and_Remarks_Pujian__c', 100);
        }
    },

    closeModel : function(component, event, helper){
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
                component.set('v.respPointPass',respo.responsePointPass);
                component.set('v.respPointFail',respo.responsePointFail);
                component.set('v.respScorePass',respo.responseScorePass);
                component.set('v.respScoreFail',respo.responseScoreFail);
                component.set('v.InfoAkurPointPass',respo.InfoAkurPointPass);
                component.set('v.InfoAkurPointFail',respo.InfoAkurPointFail);
                component.set('v.InfoAkurScorePass',respo.InfoAkurScorePass);
                component.set('v.InfoAkurScoreFail',respo.InfoAkurScoreFail);               
                component.set('v.CourtesyPointPass',respo.CourtesyPointPass);
                component.set('v.CourtesyPointFail',respo.CourtesyPointFail);
                component.set('v.CourtesyScorePass',respo.CourtesyScorePass);
                component.set('v.CourtesyScoreFail',respo.CourtesyScoreFail);

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
        var workspaceAPI = component.find("workingspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabLabel({
                tabId: focusedTabId,
                label: "SosMed Assessment"
            });
        })
        .catch(function(error) {
            console.log(error);
        });  
    },
    getSelectedValue : function (component, event, helper) {
        var picklist = component.find('Case');
        var picklistvalue = picklist.get('v.value');
        //alert(picklistvalue);
        // console.log(component.get("v.caseList"));
        component.set('v.subj' ,picklistvalue);
    }
    /*getCaseSub : function(component, event, helper){
        helper.simulateServerRequest(
            $A.getCallback(function handleServerResponse(serverResponse) {
                component.set('v.subLst', serverResponse.colors);

                /**
                 * Targets a race condition in which the options on the component does not reflect the new selected value.
                 * Check section "Generating Options On Initialization" on the documentation tab
                 
                component.set('v.selectedValue', serverResponse.selectedColorId);
            })
        );
    }*/
})