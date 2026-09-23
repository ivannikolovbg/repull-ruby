# Repull::ListingContentUpdateRequestAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **street** | **String** | Street address including the number. Required by Airbnb for every country. | [optional] |
| **city** | **String** | City / town. Required by Airbnb for every country. | [optional] |
| **state** | **String** | State, province or region. **Required for a US property**, and a listing with no &#x60;countryCode&#x60; counts as US. | [optional] |
| **postal_code** | **String** | Postal code — ZIP in the US, postcode in the UK, and so on. **Required for a US property**, and a listing with no &#x60;countryCode&#x60; counts as US. Send the complete code; a partial postcode is rejected downstream. Alias: &#x60;zipcode&#x60;. | [optional] |
| **zipcode** | **String** | Alias for &#x60;postalCode&#x60;, accepted because it is the field name on the Airbnb mirror. &#x60;postalCode&#x60; wins if you send both. | [optional] |
| **country_code** | **String** | ISO-3166 alpha-2 country code. **Send this for any non-US property.** Leaving it unset does not mean \&quot;unknown\&quot; — the publish path treats a listing with no country as US and then demands &#x60;state&#x60; and &#x60;postalCode&#x60;. | [optional] |
| **lat** | **Float** | Latitude. Never a substitute for the postal address — Airbnb rejects coordinates it cannot reconcile with a full address. | [optional] |
| **lng** | **Float** | Longitude. See &#x60;lat&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestAddress.new(
  street: null,
  city: null,
  state: FL,
  postal_code: 33139,
  zipcode: 33139,
  country_code: US,
  lat: null,
  lng: null
)
```

