({
	sum : function(component, event, helper) {
        
        console.log('Toplama işlemi tıklandı...');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        var resultvalue = Number(x) + Number(y);
        
        component.set("v.result", resultvalue);
		
	}
})