@isTest
global class AnimalFarmCalloutMock implements HttpCalloutMock{
     global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "great white shark"]}');
        response.setStatusCode(200);
        return response; 
    }
}