/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@restResource(urlMapping='/Zoom/Webhook/*')
global class ZoomWebService {
    
    // normal callout url. Integration User
    // https://triforciacohort3pack-dev-ed.develop.my.salesforce.com/services/apexrest/Zoom/Webhook/
    
    
    // guest User.  VF PAGE  Webhook 
    // https://triforciacohort3pack-dev-ed.develop.my.salesforce-sites.com/services/apexrest/Zoom/Webhook/
    
    
    @HttpGet
    global static string getHandler(){
        
        return 'Hello Zoom Service';
    }
    
    // Zoom App Info = > SF AuthProvider
    // Client ID : tocbOcBTYGzXE2XQvlG5g
    // Client secret : wf9XYpZ47OZTH5g99ScSh2CNgMTlGJoO
    // https://zoom.us/oauth/authorize
    
    // https://zoom.us/oauth/token
    //      
    //    Auth Provider  => Callback URL	https://triforciacohort3pack-dev-ed.develop.my.salesforce.com/services/authcallback/zoom            
    
    
    // webhook token : Secret Token : Apwhd9GBQqm8ZqG23UJhSw
    // Verification Token (Retires in October 2023) : 4cXhw34CTReR8a9a-nYcXQ
    // 
    // 
    // 
    
    @httpPost
    global static void postHandler(){
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        
        
        Map<String,Object> eventMap = (Map<String,Object>) JSON.deserializeUntyped(req.requestBody.toString());
        
        Map<String,Object> payloadMap = (Map<String,Object>) eventMap.get('payload');
        
        Map<String,Object> ObjectMap = (Map<String,Object>) payloadMap.get('object');
        
        String eventtype = eventMap.get('event').toString();
        
        OSNS1__zoomlog__c zoomlog = New OSNS1__zoomlog__c();
        zoomlog.OSNS1__body__c=req.requestBody.toString();
        zoomlog.OSNS1__event__c=eventtype; 
        
        insert zoomlog;  
        
        switch on eventtype {
            when 'meeting.created' {		// when block 1
               
                String ZoomURL = ObjectMap.get('join_url').toString();
                String Topic = ObjectMap.get('topic').toString();
                String start_time = ObjectMap.get('start_time').toString();
                
                Id intId = Topic.split('\\$')[0];
                
                OSNS1__zoomlog__c createLog = New OSNS1__zoomlog__c();
                createLog.OSNS1__body__c=ZoomURL;
                createLog.OSNS1__event__c=Topic; 
                
                insert createLog;  
                
                // zoom date = 2023-03-16T07:30:00Z
                
                
                 // infoDate = 2023-03-01T20:26:00.000Z
        		//  Datetime info  = yyyy-MM-dd HH:mm:ss
        		//  
        		
                start_time= start_time.replace('T', ' ');
                
                Datetime zoomTime= Datetime.valueOf(start_time); 
                
                if(String.valueOf(intId.getSObjectType())=='OSNS1__Interview__c'){
                    OSNS1__Interview__c interview = New OSNS1__Interview__c();
                    interview.id=intId;
                    interview.OSNS1__Meeting_URL__c=ZoomURL;
                    interview.OSNS1__Scheduled_DateTime__c=zoomTime;
                    interview.OSNS1__Status__c='Scheduled';
                    update interview;
                }
    
            }	
            when 'meeting.deleted' {		// when block 2
                
                String TopicDelete = ObjectMap.get('topic').toString();
                
                
            }
            when 'endpoint.url_validation' {		// when block 3
                reqData reqApex = (reqData)JSON.deserialize(req.requestBody.toString(), reqData.class);   
                
                resData resData = New resData(); 
                
                String encryptedToken ='';  
                
                
                OSNS1__zoomlog__c zoomverify = New OSNS1__zoomlog__c();
                zoomverify.OSNS1__body__c=req.requestBody.toString();
                zoomverify.OSNS1__event__c=reqApex.event; 
                
                insert zoomverify; 
                
                Blob webhookToken = Blob.valueOf('Apwhd9GBQqm8ZqG23UJhSw');
                Blob plainToken = Blob.valueOf(reqApex.payload.plainToken);
                
                Blob hmac = Crypto.generateMac('HmacSHA256', plainToken, webhookToken);
                
                encryptedToken=EncodingUtil.convertToHex(hmac);
                
                resData.plainToken = reqApex.payload.plainToken;
                resData.encryptedToken = encryptedToken;
                
                res.statusCode=200;
                res.addHeader('Content-Type', 'application/json');
                res.responseBody=Blob.valueOf(JSON.serialize(resData));
                
            }
            when else {		  // default block, optional
                
            }
        }  
        
    }
    
    global class reqData {
        global payload payload;
        global String event_ts;
        global String event;  
    }
    
    global class payload {
        Global String plainToken;
        
    }
    
    global class resData {
        Global String plainToken;
        Global String encryptedToken;
    }
    
    /*

{
"payload": {
"plainToken": "tI_4Vcf1TxGTiMKAZNRHuQ"
},
"event_ts": 1678821653285,
"event": "endpoint.url_validation"
}


{
"plainToken": "qgg8vlvZRS6UYooatFL8Aw",
"encryptedToken": "23a89b634c017e5364a1c8d9c8ea909b60dd5599e2bb04bb1558d9c3a121faa5"
}


*/
    
}