trigger Lead on Lead (after insert, after update) {
   Geocoder_Settings__c settings = CustomSettings.getGeocoderSettings();

   // If geocoding has been activated for this object in the custom settings
   if (settings.Activate_Lead_Geocoding__c) {
      Lead[] leadAddressChanged = new List<Lead>();
      for (Id id : Trigger.newMap.keySet()) {
         Lead oldLead = Trigger.oldMap == null ? null : Trigger.oldMap.get(id);
         Lead newLead = Trigger.newMap.get(id);

         // Check if any part of address has changed; if so, add them to the changed address list
         String oldAddress = oldLead == null ? '' : oldLead.Street + oldLead.City + oldLead.State + oldLead.PostalCode + oldLead.Country;
         String newAddress = newLead.Street + newLead.City + newLead.State + newLead.PostalCode + newLead.Country;
         if (oldAddress != newAddress) {
            leadAddressChanged.add(newLead);
         }
      }

      // Send changed address objects to the geocoder batchable
      if (leadAddressChanged.size() > 0) {
         sObject[] leadAddressClones = leadAddressChanged.deepClone(True);
         GeocoderBatchable addressGeocoder = new GeocoderBatchable(leadAddressClones, 'Address');
         Id billingBatchId = database.executeBatch(addressGeocoder, 1);
      }
  }
}