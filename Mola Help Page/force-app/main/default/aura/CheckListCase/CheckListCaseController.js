({
    fetchCs : function(component, event, helper) {
        console.log('masuk');
        //helper.fetchPeriodHelper(component, event, helper);
        helper.fetchCaseHelper(component, event, helper);
    },
    sorting: function(component, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        helper.sortData(component, fieldName, sortDirection);
    },
    updateSelectedText: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        console.log('selectedRows '+selectedRows);
        cmp.set('v.selectedRowsCount', selectedRows.length);
        let obj =[];
        for (var i = 0; i < selectedRows.length; i++){
            obj.push({Name:selectedRows[i].Subject});
        }
        cmp.set("v.selectedRowsList",event.getParam('selectedRows'));
    },
    cancelClick : function(component, event, helper){
        $A.get("e.force:closeQuickAction").fire()
    },
    chooseClick : function(component, event, helper) {
        var selectedRows = component.get('v.selectedRowsCount');  
        console.log('test 2: ' +selectedRows);  
        /*if(selectedRows < 15) {
            console.log('PopUp Open');
            component.set('v.OpenPopup', true);
        }else {*/
        var arr = component.get('v.myCase');
        var obj =  component.get("v.selectedRowsList");
        var recordId = component.get("v.recordId");
        var recTypeName = component.get("v.recordTypeName");
        console.log(recordId);
        console.log(JSON.stringify(obj));
        component.set("v.selectedRowsList" ,event.getParam('selectedRows'));
        console.log('selectedRows '+ 'v.selectedRowsList');
        var insertAction = component.get("c.FieldSave");
        insertAction.setParams({
            caseList: obj,
            periodId:recordId
        });
        $A.enqueueAction(insertAction);
        var targetComponent = '';
        console.log('recTypeName '+recTypeName);
        if(recTypeName == 'Social Media + Email') {
            targetComponent = "c:EditPenilaianAgent";
        }else {
            targetComponent = "c:EditCallMonitoring";
        }
        var navigateEvent = $A.get("e.force:navigateToComponent");
            navigateEvent.setParams({
            componentDef: targetComponent,
            componentAttributes: {
                recId : component.get("v.recordId")
                }
            });
            navigateEvent.fire();
        /*}*/
    },
    // filter: function(component, event, helper) {
    //     var data = component.get("v.myCase"),
    //         term = component.get("v.filter"),
    //         results = data, regex;
    //     try {
    //         console.log(data);
    //         console.log(term);
    //         regex = new RegExp(term, "i");
    //         // filter checks each row, constructs new array where function returns true
    //         results = data.filter(row=>regex.test(row.name));
    //         console.log(results);
    //     } catch(e) {
    //         // invalid regex, use full list
    //     }
    //     component.set("v.myCase", results);
    // },
    closeModel : function(component, event, helper){
        component.set('v.OpenPopup', false);
    }
})