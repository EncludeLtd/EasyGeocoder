# EasyGeocoder Package

EasyGeocoder is a package that allows for the retrieving of latitude and longitude information for standard address fields using the [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/start?hl=ar)

## Prerequisites
- [Google Maps API key](https://developers.google.com/maps/documentation/embed/get-api-key)

## Installation

Package install link:

```bash
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t3X000003P0dDQAS
```

## Configuration
### Custom Settings
![custom-settings-ss.png](https://github.com/EncludeLtd/EasyGeocoder/blob/mail/docs/images/custom-settings-ss.png?raw=true)

## Supported Fields
- Account
   - BillingAddress
      - BillingLatitude
      - BillingLongitude
   - MailingAddress
      - MailingLatitude
      - MailingLongitude
- Contact
   - MailingAddress
      - MailingLatitude
      - MailingLongitude
   - OtherAddress
      - OtherLatitude
      - OtherLongitude
- Lead
   - Address
      - Latitude
      - Longitude