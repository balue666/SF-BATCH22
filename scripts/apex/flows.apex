//Invoke Account_Autolaunched_Flow
Account acc = [SELECT Id, Name, OwnerId, CreatedBy.Name FROM Account WHERE Name = 'GenePoint' LIMIT 1];
Map<String,Object> inputs = new Map<String,Object>(); //Key = Input Field API Name, Value = The value that you wanna pass
inputs.put('AccountId', acc.Id);
inputs.put('AccountName', acc.Name);
inputs.put('AccountOwnerId', acc.OwnerId);
inputs.put('CreatedByName', acc.CreatedBy.Name);
Flow.Interview flow = new Flow.Interview.Account_Autolaunched_Flow(inputs);
flow.start();



List<Account> accounts = [SELECT Id, Name, OwnerId, CreatedBy.Name FROM Account WHERE Name = 'GenePoint'];

List<String> fruits = new List<String>{'Apple', 'Banana', 'Orange', 'Strawberry'};
Integer index = -1;
Integer targetIndex = 0;
for(String fruit : fruits){
    index++;
    if(fruit == 'Orange'){
        targetIndex = index;
    }
}
fruits.remove(targetIndex);
System.debug(fruits);


Integer totalAccs = [SELECT COUNT() FROM Account];
List<AggregateResult> result = [SELECT COUNT(AccountNumber) FROM Account];
[SELECT Industry, COUNT(Id) FROM Account GROUP BY ]



