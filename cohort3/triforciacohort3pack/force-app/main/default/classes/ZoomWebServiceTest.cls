/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class ZoomWebServiceTest {
    @isTest static void testGetHandler() {
        Test.startTest();
        String response = ZoomWebService.getHandler();
        Test.stopTest();
        
        System.assertEquals('Hello Zoom Service', response);
    }
    
    
    @isTest static void testPostHandlerMeetingCreated() {
        // Set up test data
        OSNS1__Interview__c interview = new OSNS1__Interview__c(Status__c = 'Not Scheduled');
        insert interview;
        
        String requestBody = '{"event": "meeting.created", "payload": {"object": {"join_url": "https://zoom.us/j/123456789", "topic": "' + interview.Id + '$Interview with John Doe", "start_time": "2023-03-16T07:30:00Z"}}}';
        
        Test.startTest();
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/Zoom/Webhook/';
        request.httpMethod = 'POST';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf(requestBody);
        RestContext.request = request;
        
        ZoomWebService.postHandler();
        
        Test.stopTest();
        
        // Verify that the interview record was updated
        OSNS1__Interview__c updatedInterview = [SELECT Id, OSNS1__Meeting_URL__c, 
                                                OSNS1__Scheduled_DateTime__c, OSNS1__Status__c FROM OSNS1__Interview__c WHERE Id = :interview.Id];
        System.assertEquals('https://zoom.us/j/123456789', updatedInterview.Meeting_URL__c);
        System.assertEquals(DateTime.newInstance(2023, 3, 16, 7, 30, 0), updatedInterview.OSNS1__Scheduled_DateTime__c);
        System.assertEquals('Scheduled', updatedInterview.Status__c);
    }
    
    @isTest static void testPostHandlerEndpointUrlValidation() {
        // Prepare request body
        String requestBody = '{"event": "endpoint.url_validation", "event_ts": 1678821653285, "payload": {"plainToken": "qgg8vlvZRS6UYooatFL8Aw"}}';
        
        // Prepare request
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/Zoom/Webhook/';
        request.httpMethod = 'POST';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf(requestBody);
        RestContext.request = request;
        
        // Prepare response
        RestResponse response = new RestResponse();
        RestContext.response = response;
        
        // Call postHandler
        Test.startTest();
        ZoomWebService.postHandler();
        Test.stopTest();
        
        // Verify response
        System.assertEquals(200, response.statusCode);
        System.assertEquals('application/json', response.headers.get('Content-Type'));
        
        ZoomWebService.resData responseData = (ZoomWebService.resData)JSON.deserialize(response.responseBody.toString(), ZoomWebService.resData.class);
        String expectedEncryptedToken = 'e5f3a8d5d2812e161692b5adec42e793d237c5a5b825edabbc7c2d23a91b2913';
        System.assertEquals('qgg8vlvZRS6UYooatFL8Aw', responseData.plainToken);
        System.assertEquals(expectedEncryptedToken, responseData.encryptedToken);
    }
    
}