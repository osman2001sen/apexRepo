({
	changeMsg : function(component, event, helper) {
        
        console.log('Buton tıklandı!');
        
        //v.hellomsg
        var msg = component.get("v.hellomsg");
        
        console.log(msg);
        
        component.set("v.hellomsg", "I am aura component. How can help you?"); //Mesajı değiştirdik.
        
        /* msg = component.get("v.hellomsg");
        
        console.log(msg); */
        
        console.log('----------Component------------');
        console.log(component);
		
	}
})