# Repull::ListingCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Public guest-facing title |  |
| **property_type** | **String** |  | [optional] |
| **room_type_category** | **String** | What the guest actually gets. Airbnb refuses to activate a listing that has not stated one, answering \&quot;Please specify a valid room type\&quot; — which reads like a beds problem and is not. It is never defaulted: most listings are an entire home, but hundreds are a private or hotel room, and publishing one of those as an entire home is a false claim about someone&#39;s property. Settable later with &#x60;PUT /v1/listings/{id}/content&#x60; under &#x60;details&#x60;. | [optional] |
| **property_type_category** | **String** | Airbnb&#39;s finer property-type category, when you know it. Optional. | [optional] |
| **street** | **String** | Street address including the number. Required by Airbnb for every country — a publish is refused without it. | [optional] |
| **city** | **String** | City / town. Required by Airbnb for every country — a publish is refused without it. | [optional] |
| **state** | **String** | State, province or region. **Required for a US property**, and a listing with no &#x60;countryCode&#x60; counts as US. Optional elsewhere, but stored and used wherever the channel carries it. | [optional] |
| **postal_code** | **String** | Postal code — ZIP in the US, postcode in the UK, and so on. **Required for a US property**, and a listing with no &#x60;countryCode&#x60; counts as US. Send the complete code: Booking.com rejects a partial postcode such as &#x60;SW6&#x60; where the full value is &#x60;SW6 1EP&#x60;. Alias: &#x60;zipcode&#x60;. | [optional] |
| **zipcode** | **String** | Alias for &#x60;postalCode&#x60;, accepted because it is the field name on the Airbnb mirror. &#x60;postalCode&#x60; wins if you send both. Prefer &#x60;postalCode&#x60; — the field holds non-US postcodes too. | [optional] |
| **country_code** | **String** | ISO-3166 alpha-2 country code. **Send this for any non-US property.** Omitting it does not mean \&quot;unknown\&quot; — the publish path treats a listing with no country as US, which then requires &#x60;state&#x60; and &#x60;postalCode&#x60; and will refuse the listing when they are absent. | [optional] |
| **lat** | **Float** | Latitude. Useful for map search, but never a substitute for the postal address — Airbnb rejects coordinates it cannot reconcile with a full address. | [optional] |
| **lng** | **Float** | Longitude. See &#x60;lat&#x60;. | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **Float** |  | [optional] |
| **beds** | **Integer** |  | [optional] |
| **person_capacity** | **Integer** |  | [optional] |
| **summary** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **default_daily_price** | **Float** |  | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **cancellation_policy** | **String** |  | [optional] |
| **check_in_time_start** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **allows_pets** | **Boolean** |  | [optional] |
| **allows_smoking** | **Boolean** |  | [optional] |
| **allows_children** | **Boolean** |  | [optional] |
| **allows_events** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingCreateRequest.new(
  name: Sunset Loft #2,
  property_type: apartment,
  room_type_category: entire_home,
  property_type_category: null,
  street: 123 Main St,
  city: Miami Beach,
  state: FL,
  postal_code: 33139,
  zipcode: 33139,
  country_code: US,
  lat: 25.7617,
  lng: -80.1918,
  bedrooms: 2,
  bathrooms: 1.5,
  beds: 2,
  person_capacity: 4,
  summary: null,
  description: null,
  default_daily_price: null,
  cleaning_fee: null,
  cancellation_policy: null,
  check_in_time_start: 15:00,
  check_out_time: 11:00,
  allows_pets: null,
  allows_smoking: null,
  allows_children: null,
  allows_events: null
)
```

