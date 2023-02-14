({
	doinit : function(component, event, helper) {
		
		
        
        var server = component.get("c.retrieveacc");  // accountServerController.retrieveacc();  
        
        // set parameters
       // server.setParams();
      
        // callback 
        server.setCallback(this,function(res){
            
            console.log(res);
            
            var state = res.getState();
            console.log(state);
            if(state==='SUCCESS'){
                var returnedValue = res.getReturnValue();
                
                console.log(returnedValue);
                
                component.set("v.multiAcc",returnedValue);
                
                
            } else {
                var errormsg = res.getError()[0].message;
                
                console.log(errormsg);
                 component.set("v.msg",errormsg);
                
            }
            
            
        });
        
 
        $A.enqueueAction(server);
        
	},
    
    accountcreateClientController : function(component, event, helper) {
		
		var singleaccount = component.get("v.singleAcc");

        console.log(singleaccount.Name);
        console.log(singleaccount.Phone);
        console.log(singleaccount.Website);
        
        
        var server = component.get("c.create");  // accountServerController.create(singleAcc);  // Account params.
        
        // set parameters
        server.setParams({
            'singleAcc':singleaccount
        });
        
        
        
        // callback 
        server.setCallback(this,function(res){
            
            console.log(res);
            
            var state = res.getState();
            console.log(state);
            if(state==='SUCCESS'){
                var returnedValue = res.getReturnValue();
                
                console.log(returnedValue);
                
                component.set("v.accid",returnedValue);
                
                
            } else {
                var errormsg = res.getError()[0].message;
                
                console.log(errormsg);
                 component.set("v.msg",errormsg);
                
            }
            
            
        });
  
        $A.enqueueAction(server);
        
	}
})