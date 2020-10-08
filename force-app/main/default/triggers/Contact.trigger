trigger Contact on Contact (after insert, after update) {
   Geocoder_Settings__c settings = CustomSettings.getGeocoderSettings();

   // If geocoding has been activated for this object in the custom settings
   if (settings.Activate_Contact_Geocoding__c) {
      Contact[] conMailingAddressChanged = new List<Contact>();
      Contact[] conOtherAddressChanged = new List<Contact>();
      for (Id id : Trigger.newMap.keySet()) {
         Contact oldCon = Trigger.oldMap == null ? null : Trigger.oldMap.get(id);
         Contact newCon = Trigger.newMap.get(id);

         // Check if any part of address has changed; if so, add them to the changed address list
         String oldMailing = oldCon == null ? '' : oldCon.MailingStreet + oldCon.MailingCity + oldCon.MailingState + oldCon.MailingPostalCode + oldCon.MailingCountry;
         String newMailing = newCon.MailingStreet + newCon.MailingCity + newCon.MailingState + newCon.MailingPostalCode + newCon.MailingCountry;
         if (oldMailing != newMailing) {
            conMailingAddressChanged.add(newCon);
         }
         String oldOther = oldCon == null ? '' : oldCon.OtherStreet + oldCon.OtherCity + oldCon.OtherState + oldCon.OtherPostalCode + oldCon.OtherCountry;
         String newOther = newCon.OtherStreet + newCon.OtherCity + newCon.OtherState + newCon.OtherPostalCode + newCon.OtherCountry;
         if (oldOther != newOther) {
            conOtherAddressChanged.add(newCon);
         }
      }

      // Send changed address objects to the geocoder batchable
      if (conMailingAddressChanged.size() > 0) {
         sObject[] conMailingClones = conMailingAddressChanged.deepClone(True);
         GeocoderBatchable mailingGeocoder = new GeocoderBatchable(conMailingClones, 'MailingAddress');
         Id billingBatchId = database.executeBatch(mailingGeocoder, 1);
      }
      if (conOtherAddressChanged.size() > 0) {
         sObject[] conOtherClones = conOtherAddressChanged.deepClone(True);
         GeocoderBatchable otherGeocoder = new GeocoderBatchable(conOtherClones, 'OtherAddress');
         Id shippingBatchId = database.executeBatch(otherGeocoder, 1);
      }
  }
}