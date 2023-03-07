public class ISS {
    
    public static void retrieveposition(){
        
        //datatype variableName exp
        String endpoint = 'http://api.open-notify.org/iss-now.json';
        
        Http http= New Http();
        
        HttpRequest req = New HttpRequest();
        
        req.setMethod('GET'); 
        req.setEndpoint(endpoint); // namecreadential callout (remote site  : .......)
           
        HttpResponse res = http.send(req);
        
        if(res.getStatusCode()==200){
            System.debug(res.getBody());
            
            issdata resBody = (issdata)JSON.deserializeStrict(res.getBody(),issdata.class);  
            
            System.debug(resBody.timestamp);
            System.debug(resBody.iss_position.longitude);
            System.debug(resBody.iss_position.latitude);
            
        }
        
        /*

{"timestamp": 1678220017, "message": "success", "iss_position": {"longitude": "103.9793", "latitude": "50.9895"}}

*/
    }
    
    //inner class
    
    public class issdata {
        public Integer timestamp;
        public String message;
        public iss_position iss_position;
    }
    
    public class iss_position {
       public String longitude;
       public String latitude;
    }
}