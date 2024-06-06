public class SearchAndReplace implements Database.Batchable<sObject>{

    public final String Query;
    public final String Entity;
    public final String Field;
    public final String Value;
 
    public SearchAndReplace(String q, String e, String f, String v){
 
       Query=q; Entity=e; Field=f;Value=v;
    }
 
    public Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator(query); //Only once 10,000
    }
 
    public void execute(Database.BatchableContext bc, List<sObject> scope){ //1-500, 501-1000, 1001-1500, 1501-2000,..... 9501-10000
      for(sobject s : scope){ //10000/500=20
      s.put(Field,Value); 
      }
      update scope;
     }
 
    public void finish(Database.BatchableContext bc){
    }
 }

 SearchAndReplace batchable = new SearchAndReplace(inputs);
 Database.executeBatch(batchable, 500); //1 - 2000; 2500 => 2000
