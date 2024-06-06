@isTest
public with sharing class RestCalloutsMock implements HttpCalloutMock {
    //The HttpRequest you prepared in the callout comes as input to this respond method
    public HttpResponse respond(HttpRequest request){
        //Mock Response for getAnimals
        if(request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'GET'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            String body = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}';
            response.setBody(body);
            return response;
        }

        //Mock Response for getProduct
        else if(request.getEndpoint() == 'https://dummyjson.com/product/2' && request.getMethod() == 'GET'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            String body = '{"id":2,"title":"iPhone X","description":"SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...","price":899,"discountPercentage":17.94,"rating":4.44,"stock":34,"brand":"Apple","category":"smartphones","thumbnail":"https://cdn.dummyjson.com/product-images/2/thumbnail.jpg","images":["https://cdn.dummyjson.com/product-images/2/1.jpg","https://cdn.dummyjson.com/product-images/2/2.jpg","https://cdn.dummyjson.com/product-images/2/3.jpg","https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"]}';
            response.setBody(body);
            return response;
        }

        //Mock Reponse for getRecipe
        else if(request.getEndpoint() == 'https://dummyjson.com/recipe/1' && request.getMethod() == 'GET'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            String body = '{"id":1,"name":"Classic Margherita Pizza","ingredients":["Pizza dough","Tomato sauce","Fresh mozzarella cheese","Fresh basil leaves","Olive oil","Salt and pepper to taste"],"instructions":["Preheat the oven to 475°F (245°C).","Roll out the pizza dough and spread tomato sauce evenly.","Top with slices of fresh mozzarella and fresh basil leaves.","Drizzle with olive oil and season with salt and pepper.","Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.","Slice and serve hot."],"prepTimeMinutes":20,"cookTimeMinutes":15,"servings":4,"difficulty":"Easy","cuisine":"Italian","caloriesPerServing":300,"tags":["Pizza","Italian"],"userId":45,"image":"https://cdn.dummyjson.com/recipe-images/1.webp","rating":4.6,"reviewCount":3,"mealType":["Dinner"]}';
            response.setBody(body);
            return response;
        }

        //Mock Response for postComment
        else if(request.getEndpoint() == 'https://gorest.co.in/public/v2/comments' && request.getMethod() == 'POST'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            String body = '{"id":92486,"post_id":118678,"name":"Suryakant Achari","email":"achari_suryakant@powlowski.test","body":"Omnis ut quis. Consequatur inventore dolorem."}';
            response.setBody(body);
            return response;
        }
        return null;
    }
}