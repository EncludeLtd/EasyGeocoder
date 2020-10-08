/*
    Author: Brandon DeMatteis, Enclude
    Purpose: Test GeocoderBatchable.cls
*/

@isTest public with sharing class GeocoderBatchable_Test {
    @isTest static void testCalloutSuccess() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new HttpSuccessMock());
        Account account = new Account(Name='Test Account', BillingStreet='123 Test St.', ShippingStreet='123 Test St.');
        Contact contact = new Contact(LastName='Test Contact', MailingStreet='123 Test St.', OtherStreet='123 Test St.');
        Lead lead = new Lead(LastName='Test Lead', Company = 'Test Company', Street='123 Test St.');

        test.startTest();
            insert account;
            insert contact;
            insert lead;
        test.stopTest();

        Account updatedAccount = [SELECT Id, BillingLatitude, BillingLongitude, ShippingLatitude, ShippingLongitude FROM Account WHERE Id = :account.Id LIMIT 1];
        Contact updatedContact = [SELECT Id, MailingLatitude, MailingLongitude, OtherLatitude, OtherLongitude FROM Contact WHERE Id = :contact.Id LIMIT 1];
        Lead updatedLead = [SELECT Id, Latitude, Longitude FROM Lead WHERE Id = :lead.Id LIMIT 1];
        System.assertNotEquals(null, updatedAccount.BillingLatitude);
        System.assertNotEquals(null, updatedAccount.BillingLongitude);
        System.assertNotEquals(null, updatedAccount.ShippingLatitude);
        System.assertNotEquals(null, updatedAccount.ShippingLongitude);
        System.assertNotEquals(null, updatedContact.MailingLatitude);
        System.assertNotEquals(null, updatedContact.MailingLongitude);
        System.assertNotEquals(null, updatedContact.OtherLatitude);
        System.assertNotEquals(null, updatedContact.OtherLongitude);
        System.assertNotEquals(null, updatedLead.Latitude);
        System.assertNotEquals(null, updatedLead.Longitude);
    }
    @isTest static void testCalloutFailure() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new HttpErrorMock());
        
        test.startTest();
        Account account = new Account(Name='Test Account', BillingStreet='123 Test St.', ShippingStreet='123 Test St.');
        insert account;
        test.stopTest();

        Account updatedAccount = [SELECT Id, Output__c FROM Account WHERE Id = :account.Id LIMIT 1];
        System.assertEquals('Status Code: 500: Server Error', updatedAccount.Output__c);
        
    }

    @isTest static void testCalloutFailureBlankAddress() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new HttpErrorMock());
        
        test.startTest();
        Account account = new Account(Name='Test Account');
        insert account;
        test.stopTest();

        Account updatedAccount = [SELECT Id, Output__c FROM Account WHERE Id = :account.Id LIMIT 1];
        System.assertEquals('Address is blank.', updatedAccount.Output__c);

    }

    public class HttpSuccessMock implements HttpCalloutMock {
        public HttpSuccessMock() { }
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(GoogleGeocodeResponse_Test.json);
            res.setStatusCode(200);
            res.setStatus('Ok');
            return res;
        }
    }
    public class HttpErrorMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setStatus('Server Error');
            res.setStatusCode(500);
            return res;
        }
    }
}