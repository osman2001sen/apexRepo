({
	sum : function(component, event, helper) {
        // waitress
        
        var x = component.get("v.xnum");
        var y= component.get("v.ynum");
        
        console.log(x);
        console.log(y);
        
        var server = component.get("c.sumServer");    // calcServerController.sumServer(number1,number2);
        
        // console.log('------SERVER------------');
        // console.log(server);
        // set the sum apex method parameters
        server.setParams(
            {
            "number1":x,
            "number2":y
         }
        );
        
        // get the returned values form sum apex method.
        
        server.setCallback(this,function(res){
            
           // console.log(res);
            var state = res.getState();
            
           // console.log(state);
            
            if(state==='SUCCESS'){
                var returnVal = res.getReturnValue();
                console.log(returnVal);
                component.set("v.result",returnVal);
            } else {
                var errorval = res.getError()[0].message;                
                console.log(errorval);
                component.set("v.msg",errorval);
            }

            
        });
        
       
        $A.enqueueAction(server);
        
        
	},sub : function(component, event, helper) {
        // waitress
        
        var x = component.get("v.xnum");
        var y= component.get("v.ynum");
        
        console.log(x);
        console.log(y);
        
        var server = component.get("c.subServer");    // calcServerController.subServer(number1,number2);
        
        // console.log('------SERVER------------');
        // console.log(server);
        // set the sum apex method parameters
        server.setParams(
            {
            "number1":x,
            "number2":y
         }
        );
        
        // get the returned values form sum apex method.
        
        server.setCallback(this,function(res){
            
           // console.log(res);
            var state = res.getState();
            
           // console.log(state);
            
            if(state==='SUCCESS'){
                var returnVal = res.getReturnValue();
                console.log(returnVal);
                component.set("v.result",returnVal);
            } else {
                var errorval = res.getError()[0].message;                
                console.log(errorval);
                component.set("v.msg",errorval);
            }

            
        });
        
       
        $A.enqueueAction(server);
        
        
	},mul : function(component, event, helper) {
        // waitress
        
        var x = component.get("v.xnum");
        var y= component.get("v.ynum");
        
        console.log(x);
        console.log(y);
        
        var server = component.get("c.mulServer");    // calcServerController.mulServer(number1,number2);
        
        // console.log('------SERVER------------');
        // console.log(server);
        // set the sum apex method parameters
        server.setParams(
            {
            "number1":x,
            "number2":y
         }
        );
        
        // get the returned values form sum apex method.
        
        server.setCallback(this,function(res){
            
           // console.log(res);
            var state = res.getState();
            
           // console.log(state);
            
            if(state==='SUCCESS'){
                var returnVal = res.getReturnValue();
                console.log(returnVal);
                component.set("v.result",returnVal);
            } else {
                var errorval = res.getError()[0].message;                
                console.log(errorval);
                component.set("v.msg",errorval);
            }
            
 
        });
        
       
        $A.enqueueAction(server);
        
        
	},div : function(component, event, helper) {
        // waitress
        
        var x = component.get("v.xnum");
        var y= component.get("v.ynum");
        
        console.log(x);
        console.log(y);
        
        var server = component.get("c.divServer");    // calcServerController.divServer(number1,number2);
        
        // console.log('------SERVER------------');
        // console.log(server);
        // set the sum apex method parameters
        server.setParams(
            {
            "number1":x,
            "number2":y
         }
        );
        
        // get the returned values form sum apex method.
        
        server.setCallback(this,function(res){
            
           // console.log(res);
            var state = res.getState();
            
           // console.log(state);
            
            if(state==='SUCCESS'){
                var returnVal = res.getReturnValue();
                console.log(returnVal);
                component.set("v.result",returnVal);
            } else {
                var errorval = res.getError()[0].message;                
                console.log(errorval);
                component.set("v.msg",errorval);
            }
            
        });      
       
        $A.enqueueAction(server);
            
	}
})