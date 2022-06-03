({
    fetchPeriodHelper: function (component, event, helper) {
        var actionPeriod = component.get("c.getPeriodId");
        actionPeriod.setParams({
            "csId": component.get("v.recordId")
        });
        actionPeriod.setCallback(this, function (Response) {
            var state = response.getState();
            console.log('Id');
            if (state === "SUCCESS") {
                component.set("v.periodId", response.getReturnValue());
            }
        });
        $A.enqueueAction(actionPeriod);
    },
    fetchCaseHelper: function (component, event, helper) {
        component.set('v.mycolumns', [
            { label: 'Case Number', fieldName: 'CaseNumber', type: 'text' },
            { label: 'Subject', fieldName: 'Subject', type: 'text' },
            { label: 'Origin', fieldName: 'Origin', type: 'Phone' },
            { label: 'SLA First Respond', fieldName: 'SLA_First_Response__c', type: 'text '},
            { label: 'Category', fieldName: 'Category__c', type: 'text' },
            { label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable:'true' }
        ]);
        //var action = component.get("c.fetchAccounts");
        var action = component.get("c.fetchCase");
        action.setParams({
            periodId: component.get('v.recordId'),
            //filter: component.get('v.filter')
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var resp = response.getReturnValue();
                if (resp.checkData == false) {
                    component.set("v.errMessage", 'Case for this Agent is ' + resp.csValue + '. Unable to generate case. The assessment should be equal or more than 15');
                    component.set("v.hideview", false);
                }
                else {
                    component.set("v.myCase", resp.caseList);
                    this.sortData(component, component.get("v.sortedBy"), component.get("v.sortedDirection"));
                }
                component.set("v.recordTypeName", resp.recTypeName);
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    /*FetchCasePeriode: function (component) {
        var action = component.get('c.apexfunction');
        action.setParams({ apexparam: component.get('v.hasil_yang_akan_ditaro_di_param_apex') });
        action.setCallback(this, function (result) {
            var state = result.getState();

            if (component.isValid() && state === 'SUCCESS') {
                var resultData = result.getReturnValue();
                // data processing here

            }
        });
        $A.enqueueAction(action);
    },*/
    sortData: function (component, fieldName, sortDirection) {
        var data = component.get("v.myCase");
        var reverse = sortDirection !== 'asc';
        data.sort(this.sortBy(fieldName, reverse));
        component.set("v.myCase", data);
    },
    sortBy: function (field, reverse, primer) {
        var key = primer ?
            function (x) { return primer(x[field]) } :
            function (x) { return x[field] };
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
})