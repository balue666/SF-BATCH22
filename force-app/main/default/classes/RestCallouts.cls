public with sharing class RestCallouts {
    
    //Get all the available animal details by making a callout
    public static HttpResponse getAnimals(){
        //1. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
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

    /*
        Get a product record detail from the remote system.
        Store the record detail into our custom object Product__c
    */
    public static HttpResponse getProduct(){
        //1. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyjson.com/product/2');
        request.setMethod('GET');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            ProductWrapper wrapper = (ProductWrapper)JSON.deserialize(jsonString, ProductWrapper.class);
            Product__c prod = convertToProductSobject(wrapper);
            try {
                insert prod;
            } catch(Exception ex){
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getBody());
        }
        return response;
    }

    //Helper method: Converts ProductWrapper into Product__c sobject
    private static Product__c convertToProductSobject(ProductWrapper wrapper){
        Product__c prod = new Product__c();
        prod.Product_ID__c = wrapper.id;
        prod.Name = wrapper.title;
        prod.Description__c = wrapper.description;
        prod.Price__c = wrapper.price;
        prod.Discount_Percentage__c = wrapper.discountPercentage;
        prod.Rating__c = wrapper.rating;
        prod.Stock__c = wrapper.stock;
        prod.Brand__c = wrapper.brand;
        prod.Category__c = wrapper.category;
        prod.Thumbnail__c = wrapper.thumbnail;
        return prod;
    }

    /*
        Get a recipe record detail from the remote system.
        Store the record detail into our custom object Recipe__c
    */
    public static HttpResponse getRecipe(Integer recipeId){
        //1. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyjson.com/recipe/' + recipeId);
        request.setMethod('GET');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            RecipeWrapper wrapper = (RecipeWrapper)JSON.deserialize(jsonString, RecipeWrapper.class);
            Recipe__c recipe = convertToRecipeSobject(wrapper);
            try {
                insert recipe;
            } catch(Exception ex){
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getBody());
        }
        return response;
    }

    //Helper method: converts RecipeWrapper into Recipe__c sobject
    private static Recipe__c convertToRecipeSobject(RecipeWrapper wrapper){
        Recipe__c recipe = new Recipe__c();
        recipe.Recipe_ID__c = wrapper.id;
        recipe.Name = wrapper.name;
        recipe.Ingredients__c = String.join(wrapper.ingredients, ';');
        recipe.Instructions__c = String.join(wrapper.instructions, ';');
        recipe.Cook_Time_Minutes__c = wrapper.cookTimeMinutes;
        recipe.Cuisine_Type__c = wrapper.cuisine;
        recipe.Calories_Per_Serving__c = wrapper.caloriesPerServing;
        recipe.Thumbnail__c = wrapper.image;
        recipe.Rating__c = wrapper.rating;
        return recipe;
    }

    //Make a callout to get all the comments from the remote system.
    //Store the same into Comment__c sobject
    public static HttpResponse getComments(){
        //1. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/comments');
        request.setMethod('GET');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            List<CommentWrapper> wrappers = (List<CommentWrapper>)JSON.deserialize(jsonString, List<CommentWrapper>.class);
            List<Comment__c> comments = convertToCommentSobjects(wrappers);
            try {
                insert comments;
            } catch(Exception ex){
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getBody());
        }
        return response;
    }

    //Helper Method: Converts CommentWrapper records into Custom Comment__c sobject records
    private static List<Comment__c> convertToCommentSobjects(List<CommentWrapper> wrappers){
        List<Comment__c> comments = new List<Comment__c>();
        for(CommentWrapper wrap : wrappers){
            Comment__c comm = new Comment__c();
            comm.Name = String.valueOf(wrap.id);
            comm.Post_ID__c = wrap.post_id;
            comm.Commenter_Name__c = wrap.name;
            comm.Email__c = wrap.email;
            comm.Body__c = wrap.body;
            comments.add(comm);
        }
        return comments;
    }

    //Retrieve the given comment record, convert it into wrapper followed by JSON
    //POST the json to remote system
    //{"post_id":117104,"name":"Akula Chattopadhyay","email":"akula_chattopadhyay@cremin.test","body":"Officiis magnam nihil."}
    public static HttpResponse postComment(Id commentId){
        //1. Prepare HttpRequest and wrap all the necessary information
        Comment__c comm = [SELECT Name, Post_ID__c, Commenter_Name__c, Email__c, Body__c FROM Comment__c WHERE Id = :commentId LIMIT 1];
        CommentWrapper wrap = convertToCommentWrapper(comm);
        String body = JSON.serialize(wrap);

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/comments');
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer 70e1f461fd475135683473e734663791d988ca49336b3a1002405be2ff00ed29');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    //Helper method: Converts Comment__c sobject record into CommentWrapper record
    private static CommentWrapper convertToCommentWrapper(Comment__c comm){
        CommentWrapper wrap = new CommentWrapper();
        wrap.post_id = Integer.valueOf(comm.Post_ID__c);
        wrap.name = comm.Commenter_Name__c;
        wrap.email = comm.Email__c;
        wrap.body = comm.Body__c;
        return wrap;
    }

    //Retrieve the given product record, convert it into wrapper followed by JSON
    //POST the json to remote system
    public static HttpResponse postProduct(Id prodId){
        //1. Prepare HttpRequest and wrap all the necessary information
        Product__c prod = [SELECT Brand__c, Category__c, Description__c, Discount_Percentage__c, Price__c, Product_ID__c, Rating__c, 
            Stock__c, Thumbnail__c, Name 
            FROM Product__c 
            WHERE Id = :prodId];
        ProductWrapper wrap = convertToProductWrapper(prod);
        String body = JSON.serialize(wrap);

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyjson.com/products/add');
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    //Helper method: Converts Product__c sobject record into ProductWrapper record
    private static ProductWrapper convertToProductWrapper(Product__c prod){
        ProductWrapper wrap = new ProductWrapper();
        wrap.id = Integer.valueOf(prod.Product_ID__c);
        wrap.brand = prod.Brand__c;
        wrap.category = prod.Category__c;
        wrap.description = prod.Description__c;
        wrap.discountPercentage = prod.Discount_Percentage__c;
        wrap.price = Integer.valueOf(prod.Price__c);
        wrap.rating = prod.Rating__c;
        wrap.stock = Integer.valueOf(prod.Stock__c);
        wrap.thumbnail = prod.Thumbnail__c;
        wrap.title = prod.Name;
        return wrap;
    }

    //Delete a product record with the given id (external id)
    public static HttpResponse deleteProduct(Integer externalId){
        //1. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyjson.com/products/' + externalId);
        request.setMethod('DELETE');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    @future(callout=true)
    public static void updateProduct(Id prodId){
        //1. Prepare HttpRequest and wrap all the necessary information
        Product__c prod = [SELECT Brand__c, Category__c, Description__c, Discount_Percentage__c, Price__c, Product_ID__c, Rating__c, 
            Stock__c, Thumbnail__c, Name 
            FROM Product__c 
            WHERE Id = :prodId];
        ProductWrapper wrap = convertToProductWrapper(prod);
        String body = JSON.serialize(wrap);

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyjson.com/products/' + prod.Product_ID__c);
        request.setMethod('PUT');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet (http)
        Http http = new Http();

        //3. Send the request over the internet inorder to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
    }

}