public with sharing class RestCalloutsUsingNC {
    
    //Call Remote system using NC and get account & opps details
    public static HttpResponse getOpportunities(){
        //1. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_Remote_System/services/apexrest/Opps/0015g00000RHHK2AAP');
        request.setMethod('GET');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }
}