# Repull::Property

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull property ID. Equal to the listing id (&#x60;listings.id&#x60;); the same integer is used as &#x60;listingId&#x60; on reservations and &#x60;propertyId&#x60; on availability. | [optional] |
| **name** | **String** | Property name | [optional] |
| **address** | **String** | Street address (from the listing&#39;s &#x60;street&#x60; field). | [optional] |
| **city** | **String** |  | [optional] |
| **latitude** | **Float** | Detail endpoint only. | [optional] |
| **longitude** | **Float** | Detail endpoint only. | [optional] |
| **currency** | **String** | ISO 4217 currency code for this property&#39;s pricing. | [optional] |
| **status** | **String** | Derived from &#x60;listings.active&#x60;. | [optional] |
| **lifecycle_status** | **String** | The listing&#39;s lifecycle state (e.g. &#x60;live&#x60;, &#x60;draft&#x60;, &#x60;archived&#x60;). | [optional] |
| **created_at** | **Time** | When the property was created. Detail endpoint only. | [optional] |
| **channels** | **Array&lt;String&gt;** | OTAs/channels this property is actively published on, as channel-name strings (e.g. &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;). Empty array when the property has no active channel links. List endpoint (&#x60;GET /v1/properties&#x60;) only. | [optional] |
| **amenities** | [**Array&lt;ListingAmenity&gt;**](ListingAmenity.md) | Amenity rows for the property. Detail endpoint only, and **only present when the caller passes &#x60;?include&#x3D;amenities&#x60;.** Empty array (&#x60;[]&#x60;) when the property has no amenity rows. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Property.new(
  id: null,
  name: Oceanview Suite #3,
  address: null,
  city: Miami Beach,
  latitude: 25.7617,
  longitude: -80.1918,
  currency: USD,
  status: null,
  lifecycle_status: null,
  created_at: null,
  channels: [&quot;airbnb&quot;,&quot;booking&quot;],
  amenities: null
)
```

