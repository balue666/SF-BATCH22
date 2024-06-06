@isTest
public with sharing class ParksCalloutMock implements WebServiceMock {
    public void doInvoke(Object stub, Object soapRequest, Map<String,Object> responseMap, String endpoint, String soapAction, String requestName, String responseNamespace, String responseName, String responseType){
        ParksServices.byCountryResponse response_x = new ParksServices.byCountryResponse();
        response_x.return_x = new List<String>{'Park 1', 'Park 2', 'Park 3'};
        responseMap.put('response_x', response_x);
    }
}