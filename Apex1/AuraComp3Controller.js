({
	sum : function(component, event, helper) {
		console.log('Toplama işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        var resultvalue = Number(x)+Number(y);
        
        component.set("v.result",resultvalue);
	component.set("v.process", " + ");
        
	},  sub : function(component, event, helper) {
		console.log('Çıkarma işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        var resultvalue = Number(x)-Number(y);
        
        component.set("v.result",resultvalue);
	component.set("v.process", " - ");
        
	},  mul : function(component, event, helper) {
		console.log('Çarpma işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        var resultvalue = Number(x)*Number(y);
        
        component.set("v.result",resultvalue);
	component.set("v.process", " * ");
        
    },  div : function(component, event, helper) {
		console.log('Bölme işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        var resultvalue = Number(x)/Number(y);
        
        component.set("v.result",resultvalue);
	component.set("v.process", " / ");
    }
})