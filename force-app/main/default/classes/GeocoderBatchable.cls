/*
    Author: Brandon DeMatteis, Enclude
    Purpose: Call out to Google Maps Geocoding API and update standard address geolocation fields
    Tested in: GeocoderBatchable_Test.cls
*/

public class GeocoderBatchable implements Database.Batchable<sObject>, Database.AllowsCallouts {
    // Map standard address fields to their prefixes, ex: BillingAddress => BillingLatitude, BillingLongitude
    private Map<String, String> prefixMap = new Map<String, String> {
        'Address' => '',
        'BillingAddress' => 'Billing',
        'MailingAddress' => 'Mailing',
        'OtherAddress' => 'Other',
        'ShippingAddress' => 'Shipping'
    };
    private String prefix;
    private Geocoder_Settings__c settings;
    private List<sObject> records;
    private String addressField;
    
    public GeocoderBatchable(List<sObject> records, String addressField) {
        this.settings = CustomSettings.getGeocoderSettings();
        this.records = records;
        this.addressField = addressField;
        this.prefix = this.prefixMap.get(addressField);
    }

    public List<sObject> start(Database.BatchableContext bc) {
        return this.records;
    }

    public void execute(Database.BatchableContext bc, List<sObject> records) {
        for (sObject record : records) {

            // Clear previous values
            record.put(this.prefix + 'Latitude', null);
            record.put(this.prefix + 'Longitude', null);
            record.put('ez_geo__Output__c', null);

            // Get address as text and URL encode
            String [] addressFields = new List<String>{
                (String)record.get(this.prefix + 'Street'),
                (String)record.get(this.prefix + 'City'),
                (String)record.get(this.prefix + 'State'),
                (String)record.get(this.prefix + 'PostalCode'),
                (String)record.get(this.prefix + 'Country')
            };
            String addressText = '';
            for (String field : addressFields) {
                if (!String.isBlank(field)) {
                    addressText += field + ' ';
                }
            }
            addressText = addressText.removeEnd(' ');
            // Address is blank, update output field and break
            if (String.isBlank(addressText)) { appendToDebugOutput(record, 'Address is blank.'); break; }
            String encodedAddress = EncodingUtil.urlEncode(addressText, 'UTF-8');

            // Build HTTP request call to Google Maps
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + encodedAddress + '&key=' + this.settings.API_Key__c;
            request.setEndpoint(url);
            request.setMethod('GET');

            // Make request; If errors, append message to record debug output
            HttpResponse response;
            try { response = http.send(request); } catch(Exception e) { appendToDebugOutput(record, e.getMessage()); break; }
            if (response.getStatusCode() != 200) { appendToDebugOutput(record, 'Status Code: ' + String.valueOf(response.getStatusCode() + ': ' + response.getStatus())); break; }
            
            // Parse response
            GoogleGeocodeResponse parsedResponse = (GoogleGeocodeResponse)JSON.deserialize(response.getBody(), GoogleGeocodeResponse.class);
            if (parsedResponse.status != 'OK') { appendToDebugOutput(record, 'API Response Status: ' + parsedResponse.status); break; }

            // If no results or more than 1 result, append to record debug output
            GoogleGeocodeResponse.Results[] results = parsedResponse.results;
            if (results.size() == 0) { appendToDebugOutput(record, 'No address results found'); break; }
            if (results.size() > 1) {appendToDebugOutput(record, 'Given address is ambiguous. Verify that the coordinates are correct.');}

            // Update geolocation fields
            Object lat = results.get(0).geometry.location.lat;
            Object lng = results.get(0).geometry.location.lng;
            record.put(this.prefix + 'Latitude', lat);
            record.put(this.prefix + 'Longitude', lng);
        }
        update records;

    }

    // Appends relevant debug information to objects ez_geo__Output__c field
    private void appendToDebugOutput(sObject record, String message) {
        String previousOutput = (String)record.get('ez_geo__Output__c');
        String newOutput = String.isBlank(previousOutput) ? message : previousOutput + '; ' + message;
        record.put('ez_geo__Output__c', newOutput);
    }
    
    public void finish(Database.BatchableContext bc){ }

}