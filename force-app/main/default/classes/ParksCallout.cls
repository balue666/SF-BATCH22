public with sharing class ParksCallout {
    //get parks available in a country
    public static String[] getParks(String country){
        ParksServices.ParksImplPort service = new ParksServices.ParksImplPort(); //Outer Class.Inner Class
        String[] parks = service.byCountry(country);
        System.debug(parks);
        return parks;
    }
}