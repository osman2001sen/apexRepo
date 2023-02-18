({
    calculatorOpenClose: function(component, event, helper) {
		console.log('Calculator OpenClose çalıştı....');
        
        var isCalcOpen = component.get("v.isCalcOpen");
        var buttonText = component.get("v.buttonText");
        
        console.log(isCalcOpen);
        console.log(buttonText);
        
        component.set("v.isCalcOpen", !isCalcOpen);
        
        console.log('İşlem Sonrası');
        
        if(isCalcOpen == true){
            component.set("v.buttonText", "SHOW");
        } else {
            component.set("v.buttonText", "HIDE");
        }

		iscalcOpen = component.get("v.isCalcOpen");
		buttonText = component.get("v.buttonText");
		console.log(isCalcOpen);
		console.log(buttonText);        
        
    }, doinit : function(component, event, helper) {
		console.log('doinit çalıştı....');
        
    },  sum : function(component, event, helper) {
		console.log('Addition is executed....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)+Number(y);
        
        console.log(result);
        
        component.set("v.result",result);

        component.set("v.process"," + ");
        
        
	}, sub : function(component, event, helper) {
		console.log('Subtraction is executed....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)-Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        component.set("v.process"," - ");
        
    }, mul : function(component, event, helper) { 
		console.log('Multiplication is executed....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)*Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        component.set("v.process"," * ");
        
	} , div : function(component, event, helper) {
		console.log('Division is executed....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)/Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        component.set("v.process"," / ");
        
	}          
})