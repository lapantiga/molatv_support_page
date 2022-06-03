({
    save_data : function(component, event, helper) {
        console.log('Mardi recId');
        console.log(component.get("v.recId"));
        var action = component.get('c.SaveAssest');
        action.setParams({
            Assest :component.get("v.input"),
            "recId" :component.get("v.recId")
            });
        action.setCallback(this, function(result) {
            var state = result.getState();
            console.log(state);
            if (component.isValid() && state === 'SUCCESS'){
                console.log(component.isValid());
                var resultData = result.getReturnValue();
                $A.get('e.force:refreshView').fire();
                //component.set('v.input' , '');
                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "SUCCESS!",
                    message: "Record has been saved",
                    type: "success"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
    }
})