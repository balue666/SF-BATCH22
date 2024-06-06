public with sharing class ContactCtrl {
    //Get contacts which contains the given searchKey in the Name //Json John
    //Json John => so
    @AuraEnabled
    public static List<Contact> getMatchingContacts(String searchKey){
        searchKey = '%' + searchKey + '%';
        return [SELECT Id, Name, Title, Department, Email, Phone
        FROM Contact
        WHERE Name LIKE :searchKey
        WITH SECURITY_ENFORCED];
    }
}