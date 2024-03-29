/*
    Author: Eamon Kelly, Enclude
    Implemented by: Brandon DeMatteis
    Purpose: Provide centralised access to the custom settings and make a copy available in test
    Tested in: CustomSettings_Test.cls
    Copied from Advanced Apex Programming by Dan Appleman
*/

global with sharing class CustomSettings {
    private static Geocoder_Settings__c geocoderSettings = null;
    
    global static Geocoder_Settings__c getGeocoderSettings()
    {
        if (geocoderSettings!=null) { return geocoderSettings; }
        
        Geocoder_Settings__c setting = Geocoder_Settings__c.getOrgDefaults();
        Geocoder_Settings__c emptySetting = new Geocoder_Settings__c();
        if(setting==null || setting == emptySetting) 
        {
            setting = new Geocoder_Settings__c(Name = 'default', API_Key__c='testKey', Activate_Account_Geocoding__c=false, Activate_Contact_Geocoding__c=false, Activate_Lead_Geocoding__c=false);
            insert setting;
        }
        return setting;
    }

    public static String apiKey
    {
        get
        {
            return getGeocoderSettings().API_Key__C == null ? '' : getGeocoderSettings().API_Key__C;
        }
    }
    public static Boolean activateAccountGeocoding
    {
        get
        {
            return getGeocoderSettings().Activate_Account_Geocoding__c == null ? false : getGeocoderSettings().Activate_Account_Geocoding__c;
        }
    }
    public static Boolean activateContactGeoCoding
    {
        get
        {
            return getGeocoderSettings().Activate_Contact_Geocoding__c == null ? false : getGeocoderSettings().Activate_Contact_Geocoding__c;
        }
    }
    public static Boolean activateLeadGeocoding
    {
        get
        {
            return getGeocoderSettings().Activate_Lead_Geocoding__c == null ? false : getGeocoderSettings().Activate_Lead_Geocoding__c;
        }
    }
    
}