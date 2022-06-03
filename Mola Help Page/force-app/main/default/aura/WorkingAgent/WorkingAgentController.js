({
    doInit: function(component, event, helper) {
        console.log(component.get("v.recordId"));
        helper.getWorkingAgentList(component);
    },
    submitAgent: function(component, event, helper){
        helper.setAgent(component);
    }
})