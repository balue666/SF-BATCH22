JSON:
=================================

//1. Get an account record whose revenue is greater than 5M, convert it into JSON
Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue, Rating FROM Account WHERE AnnualRevenue > 5000000 LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

//2. Get all Opportunities whose Amount is greater than 50K, convert them into JSON
List<Opportunity> opps = [SELECT Id, Name, Type, StageName, Amount FROM Opportunity WHERE Amount > 50000];
String jsonString = JSON.serialize(opps);
System.debug(jsonString);

//3. Get an account Edge Communications along with its children opps
Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue, Rating, (SELECT Id, Name, Type, StageName, Amount FROM Opportunities)
    FROM Account
    WHERE Name = 'Edge Communications'
    LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

//4. Get opp name = 'Edge Installation' along with its account info
Opportunity opp = [SELECT Id, Name, Type, StageName, Amount, Account.Id, Account.Name, Account.Type, Account.Industry
    FROM Opportunity
    WHERE Name = 'Edge Installation'
    LIMIT 1];
String jsonString = JSON.serialize(opp);
System.debug(jsonString);


///TESTS///
RestCallouts.getAnimals();
RestCallouts.getProduct();
RestCallouts.getRecipe(5);
RestCallouts.getComments();
RestCallouts.postComment('a05IR00002qCFIcYAO');
RestCallouts.postProduct('a03IR00001h2dOVYAY');
RestCallouts.deleteProduct(1);

RestCalloutsUsingNC.getOpportunities();


//SOAP Callouts
ParksCallout.getParks('India');
CalculatorCallout.getSum(20, 30);
CalculatorCallout.getProduct(20, 30);