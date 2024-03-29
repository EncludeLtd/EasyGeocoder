/*
    Author: Brandon DeMatteis, Enclude
    Purpose: Test CustomSettings.cls
*/

@isTest
public class CustomSettingsTest {
    @isTest
    static void geocoderSettings() {
        Test.startTest();
        String APIKey = CustomSettings.APIKey;
        Boolean activateAccountGeocoding = CustomSettings.activateAccountGeocoding;
        Boolean activateContactGeocoding = CustomSettings.activateContactGeocoding;
        Boolean activateLeadGeocoding = CustomSettings.activateLeadGeocoding;
        Test.stopTest();

        System.assertEquals('testKey', APIKey);
        System.assert(!activateAccountGeocoding);
        System.assert(!activateContactGeocoding);
        System.assert(!activateLeadGeocoding);
    }

    @isTest
    static void test() {
        insert new List<Account>{
            new Account(Name = 'Test', AnnualRevenue = 555.55),
            new Account(Name = 'Test', AnnualRevenue = 555.55)
        };
    }

}