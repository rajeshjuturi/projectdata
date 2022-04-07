@isTest
private class AnimalFarmTest {
   @isTest
    static void testAnimals(){
        Test.setMock(HttpCalloutMock.class, new AnimalFarmCalloutMock()); 
      
         HttpResponse response = AnimalFarm.animals();
        String fakeBody= response.getBody();
        String expected ='{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "great white shark"]}';
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals(fakeBody, expected);
    }
}