/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-09-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ISSAPI {

    public static void position(){

	ExternalService.station service = New ExternalService.station();
        
        // ExternalService.station.issnow_Request req = New ExternalService.station.issnow_Request(); // we have no any request specifications....
         
        ExternalService.station.issnow_Response res = service.issnow();
  
        system.debug(res.Code200.issx5fposition.latitude);  // iss_position = issx5fposition
		system.debug(res.Code200.issx5fposition.longitude);     
    }
}