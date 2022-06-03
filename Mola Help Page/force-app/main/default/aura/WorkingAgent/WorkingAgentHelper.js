({
	getWorkingAgentList : function(component) {
		// Request from server
        var action = component.get("c.getWorkingAgents");
        action.setParams({
            caseId: component.get('v.recordId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.info(state);
            if(state == "SUCCESS"){
                var responseObj = JSON.parse(response.getReturnValue());
                var agentObj = responseObj.agentList;
                agentObj.sort();
                var agentList = [];
                var idx = 0;
                agentObj.forEach(function(el){
                    agentList[idx] = {id: el, name: el};
                    idx++;
                });
                component.set("v.agentList", agentList);

                var currentAgent = responseObj.currentAgent;
                
                if(currentAgent != ''){
                    console.info(currentAgent);
                    component.set('v.selectedAgent', currentAgent);
                }
            }
        });
        
        $A.enqueueAction(action);
	},
    setAgent : function(component) {
        console.log(component.find("workingAgent").get("v.value"));

        var action = component.get("c.setWorkingAgent");
        action.setParams({
            inputId: component.get('v.recordId'),
            agentName: component.find("workingAgent").get("v.value")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.info(state);
            if(state == "SUCCESS"){
                var response = JSON.parse(response.getReturnValue());
                console.log(response.status);
                console.log(response.message);
                component.set("v.responseMessage", response.message);
                if(response.status=="OK")
                    $A.get('e.force:refreshView').fire();
            }
        });
        
        $A.enqueueAction(action);
	}
})