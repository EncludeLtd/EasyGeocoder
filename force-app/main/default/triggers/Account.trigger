trigger Account on Account (after insert, after update) {
   Geocoder_Settings__c settings = CustomSettings.getGeocoderSettings();

   // If geocoding has been activated for this object in the custom settings
   if (settings.Activate_Account_Geocoding__c) {
      Account[] accBillingAddressChanged = new List<Account>();
      Account[] accShippingAddressChanged = new List<Account>();
      for (Id id : Trigger.newMap.keySet()) {
         Account oldAcc = Trigger.oldMap == null ? null : Trigger.oldMap.get(id);
         Account newAcc = Trigger.newMap.get(id);

         // Check if any part of address has changed; if so, add them to the changed address list
         String oldBilling = oldAcc == null ? '' : oldAcc.BillingStreet + oldAcc.BillingCity + oldAcc.BillingState + oldAcc.BillingPostalCode + oldAcc.BillingCountry;
         String newBilling = newAcc.BillingStreet + newAcc.BillingCity + newAcc.BillingState + newAcc.BillingPostalCode + newAcc.BillingCountry;
         if (oldBilling != newBilling) {
            accBillingAddressChanged.add(newAcc);
         }
         String oldShipping = oldAcc == null ? '' : oldAcc.ShippingStreet + oldAcc.ShippingCity + oldAcc.ShippingState + oldAcc.ShippingPostalCode + oldAcc.ShippingCountry;
         String newShipping = newAcc.ShippingStreet + newAcc.ShippingCity + newAcc.ShippingState + newAcc.ShippingPostalCode + newAcc.ShippingCountry;
         if (oldShipping != newShipping) {
            accShippingAddressChanged.add(newAcc);
         }
      }

      // Send changed address objects to the geocoder batchable
      if (accBillingAddressChanged.size() > 0) {
         sObject[] accBillingClones = accBillingAddressChanged.deepClone(True);
         GeocoderBatchable billingGeocoder = new GeocoderBatchable(accBillingClones, 'BillingAddress');
         Id billingBatchId = database.executeBatch(billingGeocoder, 1);
      }
      if (accShippingAddressChanged.size() > 0) {
         sObject[] accShippingClones = accShippingAddressChanged.deepClone(True);
         GeocoderBatchable shippingGeocoder = new GeocoderBatchable(accShippingClones, 'ShippingAddress');
         Id shippingBatchId = database.executeBatch(shippingGeocoder, 1);
      }
  }
}